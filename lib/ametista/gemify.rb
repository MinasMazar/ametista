module Ametista
  module Gemify

    module InstanceMethods
      def _gem_content
        code = "# Your code goes here.."
        content = code
        space = "\s"
        _heritage.reverse.each_with_index do |anc, i|
          obj = eval(_heritage[0..i].join("::")).is_a?(Class) ? "class" : "module"
          content.sub! code, "\n#{space * i}#{obj} #{anc}\n#{space * i}#{code}\n#{space * i}end\n"
        end
        content
      end
    end

    def self.included(klass)
      
      Object.class_eval do

        include InstanceMethods

        def _namespace
          eval _heritage.join("::")
        end

        def _heritage
          ancestors[0].to_s.split('::')
        end

        def _gem_root
          #return "#{$1}/lib/" if File.expand_path('.').match /(.+)\/lib/
          return File.join(File.expand_path('.'), "lib")
          raise StandardError.new "Gemifycation failed: root not found."
        end
    
        def _gem_path
          File.join _gem_root, _heritage.join(File::SEPARATOR).fs_normalize
        end
        
        def _gem_create
          FileUtils.mkpath _gem_path + "/"
          obj_file = File.new _gem_path + ".rb", 'w'
          obj_file.write _gem_content
          obj_file.close
        end

      end
      
    end
  end
end
