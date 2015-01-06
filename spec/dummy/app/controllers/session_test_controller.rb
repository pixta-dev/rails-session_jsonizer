class SessionTestController < ApplicationController

  def set_session
    params[:session].each do |k, v|
      session[k] = v
    end
    params[:flash].each do |k, v|
      flash[k] = v
    end
    render nothing: true
  end

  def index
    render text: Marshal.dump({session: session.to_hash, flash: flash.to_hash})
  end
end
