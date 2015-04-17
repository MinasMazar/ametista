module Ametista
  module Crono

    def timeout(sec, &block)
      sleep sec.to_i
      block.call
    end

    def hooked_timeout(sec, sec_proc, &block)
      i = sec
      while i > 0
        sec_proc.call i
        sleep 1
        i -= 1
      end
      block.call
    end

    @@threads = []

    def threaded(&block)
      @@threads << Thread.new(&block)
    end

  end

  class BifrostCLI

    include Crono

    desc "echo_timeout <message> <secs>", "Echo message after secs. sleep."
    def echo_timeout(message, seconds)
      timeout seconds do
        system "echo \"#{message}\""
      end
    end

  end
end
