
module Ametista
  module Iterators
    class ::Array
      def triterate(&block)
        each_with_index do |e, i|
          if size < 3
            block.call(nil, e, nil)
          elsif i == 0
            block.call(nil, e, self[i + 1])
          elsif i >= (size - 1)
            block.call(self[i - 1], e, nil)
          else
            block.call(self[i - 1], e, self[i + 1])
          end
        end
      end
    end
  end
end

        