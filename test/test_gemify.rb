require 'minitest/autorun'
require 'ametista'

class GemifyTest < Minitest::Test

  module Mod
    module Mod_In
    end
    class Foo
    end
  end

  def test_gemify
    Mod::Mod_In._gem_create
    Mod::Foo._gem_create
    assert File.exists? Mod::Mod_In._gem_path
    assert File.exists? Mod::Foo._gem_path
  end

end