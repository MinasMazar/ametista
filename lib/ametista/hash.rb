module Ametista
  module Hash
    module HashAccessor
      def method_missing(meth, *args, &block)
        self.send :[], meth.to_sym
      end
    end
  end
end
      