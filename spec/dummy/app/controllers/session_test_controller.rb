class SessionTestController < ApplicationController

  def set_session
    params[:session].each do |k, v|
      session[k] = v
    end
    params[:flash].each do |k, v|
      flash[k] = v
    end
    redirect_to session_test_index_path
  end

  def index
    # Use flash to sweep it
    flash[:notice]
    render text: Marshal.dump({session: session.to_hash.symbolize_keys, flash: flash.to_hash.symbolize_keys})
  end
end
