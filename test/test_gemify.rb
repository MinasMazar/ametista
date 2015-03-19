require 'minitest/autorun'
require 'ametista'
require 'pry'

class GemifyTest < Minitest::Test

  module Mod
    module Mod_In
    end
    class Foo
    end
  end

  # binding.pry

  def test_heritage
   assert_equal Mod::Foo._heritage, [ "GemifyTest", "Mod", "Foo" ]
 end

  def test_gemify_mod_in
    Mod::Mod_In._gem_create
    assert File.exists? Mod::Mod_In._gem_path
  end

  def test_gemify_foo
    Mod::Foo._gem_create
    assert File.exists? Mod::Foo._gem_path
    Mod::Foo._gem_path
  end

  def test_namespace
    assert_equal Mod::Foo._namespace, Mod::Foo
  end

  def test_content
    puts Mod._gem_content + "\n######\n"
    puts Mod::Mod_In._gem_content + "\n######\n"
    puts Mod::Foo._gem_content + "\n######\n"
  end

end