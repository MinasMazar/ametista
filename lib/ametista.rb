require "ametista/version"
require "ametista/classes"
require "ametista/iterators"
require "ametista/strings"
require "ametista/logger"
require "ametista/modules"
require "ametista/gemify"

module Ametista
  # Auto inject Gemify methods into Modules
  include Ametista::Gemify
end
