require 'minitest/autorun'
require 'ametista'
require 'pry'

class CrontTest < Minitest::Test

  include Ametista::Crono

  def test_timeouts
    timeout 4 do
      puts "You might see this message after 5 seconds of sleeping.."
    end
  end

  def test_threaded_timeouts
    threaded do
      timeout 2 do
        puts "You might see this message at time 2"
      end
    end
  end

end
