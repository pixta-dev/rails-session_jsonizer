module ActionDispatch
  module Session
    class TestStore < AbstractStore
      cattr_accessor :session_jsons
      self.session_jsons = {}

      def session_exists?(env)
        true
      end

      def get_session(env, sid)
        json = self.class.session_jsons[sid]
        session = json ? SessionJsonizer.new.load(json) : {}
        [sid, session]
      end

      def set_session(env, sid, session_data, options)
        self.class.session_jsons[sid] = SessionJsonizer.new.dump(session_data)
        sid
      end

      def destroy_session(env, sid, options)
        self.class.session_jsons.delete(sid)
      end
    end
  end
end

Rails.application.config.session_store :test_store
