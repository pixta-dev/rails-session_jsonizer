module ActionDispatch
  module Session
    class TestStore < ActionDispatch::Session::AbstractStore
      cattr_accessor :session_json

      def get_session(env, sid)
        json = self.class.session_json
        session = json ? SessionJsonizer.load(json) : {}
        [sid, session]
      end

      def set_session(env, sid, session_data, options)
        self.class.session_json = SessionJsonizer.dump(session_data)
        sid
      end
    end
  end
end

Rails.application.config.session_store :test_store
