module Ametista
  module Logger

    class LoggerAdapter

      def self.get_instance
        @@logger ||= new
      end

      def self.change_adapter(adapter)
        @@logger = adapter.new
      end

      def print(msg)
        raise RuntimeError.new "Not implemented."
      end

      def info(msg)
        raise RuntimeError.new "Not implemented."
      end

      def debug(msg)
        raise RuntimeError.new "Not implemented."
      end
    end

    class StdoutLogger < LoggerAdapter

      def print(msg)
        puts msg
      end

      def info(msg)
        puts msg
      end

      def debug(msg)
        puts msg
      end

    end

    def logger
      LoggerAdapter.get_instance
    end

  end
end
