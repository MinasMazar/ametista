require 'yaml'

module Ametista
  module ConfRepo

    DEFAULT_CONF_FILE = File.expand_path '~/.ametista_confrepo.yaml'

    def self.gen_conf(pathname = DEFAULT_CONF_FILE)
      f = File.new pathname, 'w'
      f.write YAML.dump(Object.new)
      f.close
    end

    def self.load_conf(pathname)
      YAML.load_file pathname
    end

    def self.save_conf(conf, pathname)
      File.write pathname, YAML.dump(conf)
    end

    attr_writer :conf_file
    def conf_file
      @conf_file ||= DEFAULT_CONF_FILE
    end

    def get_confrepo
      ConfRepo.load_conf self.conf_file
    end

    def set_confrepo(data)
      data = get_confrepo.merge data
      ConfRepo.save_conf data, self.conf_file
    end
  end

  class BifrostCLI
    include ConfRepo
  end

end