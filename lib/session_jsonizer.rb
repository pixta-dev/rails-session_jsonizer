module SessionJsonizer

  module_function

  def load(value)
    ::Rails.logger.debug "serializer load: #{value}"
    if value.first == '{'
      ::JSON.load(value).map do |key, value|
        new_value =
          case
          when key == 'flash'
            load_flash(value)
          when value.is_a?(Hash)
            value.with_indifferent_access
          else
            value
          end
        [key, new_value]
      end.to_h
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

    def dump_flash(session_value)
      ActionDispatch::Flash::FlashHash.from_session_value(session_value).to_hash
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
