module Ametista
  module Logger

    class LoggerAdapter

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
      @@logger ||= StdoutLogger.new # TODO: move singleton implementation from adapter class to namespace module
    end

    # This expose logger in class namespace
    def self.included(klass)
      klass.extend Logger
    end

  end
end
