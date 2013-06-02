Dir['middleman_ember_scaffold/generators/types/**.rb'].each do
  require file
end


module MiddlemanEmberScaffold
  module Generators
    class Generate < Thor
      include Thor::Actions
      def self.source_root
        File.expand_path(File.dirname(__FILE__), "../template")
      end

      desc "generate types", "Run mes generators"
      def generate(*args)
        type = args[0]
        file = args[1]
        throw 'not implemented'
        case type
        when 'model'
          
          mg = ModelGenerator.new
          mg.invoke :generate [path, name]

        when 'view'
          
          vg = ViewGenerator.new
          vg.invoke :generate [path, name]
        
        when 'controller'

          cg = ControllerGenerator.new
          cg.invoke :generate [path, name]
        
        when 'template'

          tg = TemplateGenerator.new
          tg.invoke :generate [path, name]

        else
          puts "Type must be one of the following: [model,view,controller,template]"
        end
      end
    end
  end
end







