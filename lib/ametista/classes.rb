module Ametista
  module ClassAccessor

    class ::Object

      define_method :array_reader do |*arr|

        arr.each do |a|

          define_method a do
            instance_variable_set "@#{a}", instance_variable_get("@#{a}") || []
          end

        end

      end

    end

  end
end