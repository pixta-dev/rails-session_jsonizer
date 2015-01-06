module SessionJsonizer

  module_function

  def load(value)
    ::Rails.logger.debug "serializer load: #{value}"
    if value.first == '{'
      ::JSON.load(value).tap do |session|
        if session['flash']
          session['flash'] = load_flash(session['flash'])
        end
      end
    else
      ::Marshal.load(value)
    end
  end

  def dump(session)
    ::Rails.logger.debug "serializer dump: #{session}"

    if session['flash']
      session['flash'] = dump_flash(session['flash'])
    end

    ::JSON.dump(session)
  end

  case Rails::VERSION::MAJOR
  when 4
    def load_flash(data)
      { 'flashes' => data, 'discard' => [] }
    end

    def dump_flash(flash)
      ActionDispatch::Flash::FlashHash.from_session_value(flash).to_hash
    end

  when 3
    def load_flash(data)
      ActionDispatch::Flash::FlashHash.new.update(data.symbolize_keys)
    end

    def dump_flash(flash)
      flash.sweep
      flash.to_hash
    end
  end

end
