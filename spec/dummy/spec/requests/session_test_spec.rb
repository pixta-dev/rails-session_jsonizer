require 'rails_helper'

describe 'session test' do

  let(:session_hash) {
    {
      'foo' => {
        'bar' => 'baz',
        'hoge' => ['piyo', 'fuga']
      }
    }
  }
  let(:notice) { 'this is notice' }

  before do
    post '/session_test/set_session', session: session_hash, flash: {notice: notice}
    get '/session_test'
  end

  describe 'stored session' do
    let(:result) { Marshal.load(response.body) }
    it { expect(result[:session]['foo']).to eq(session_hash['foo']) }
    it { expect(result[:flash][:notice]).to eq(notice) }
  end

  describe 'flash sweep' do
    before do
      get '/session_test'
    end

    it { expect(flash[:notice]).to be_nil }
  end
end
