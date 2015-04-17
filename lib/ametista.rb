require "ametista/version"
require "ametista/classes"
require "ametista/iterators"
require "ametista/strings"
require "ametista/logger"
require "ametista/crono"
require "ametista/modules"
require "ametista/gemify"
require "ametista/hash"
require "ametista/bifrost"

module Ametista
  # Auto inject Gemify methods into Modules
  include Ametista::Gemify
end
