module Ametista
  module Gemify
    def self.included(klass)
    
      Object.class_eval do
        def _heritage
          ancestors[0].to_s.split('::')
        end

        def _gem_root
          return "#{$1}/lib/" if File.expand_path('.').match /(.+)\/lib/
          raise StandardError.new "Gemifycation failed: root not found."
        end
    
        def _gem_path
          _gem_root + _heritage.join(File::SEPARATOR).fs_normalize
        end
        
        def _gem_create
          FileUtils.mkpath _gem_path + "/"
          File.new _gem_path + ".rb", 'w' if self.class.is_a? Class
        end
      end
      
    end
  end
end
