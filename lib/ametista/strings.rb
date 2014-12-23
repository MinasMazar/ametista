module Ametista
  module Strings
    def self.included(klass)
      String.define_method :lamerize do
        self.capitalize
      end
    end
  end
end
