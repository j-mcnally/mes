require "middleman_ember_scaffold/generators/scaffold"
require "middleman_ember_scaffold/generators/generate"

module MiddlemanEmberScaffold::Cli
  class Scaffold < Thor
    include Thor::Actions
    check_unknown_options!
    namespace :new
    desc "new [path]", "Generate a new scaffold in a folder"
    method_option :path,
        :aliases => "-p",
        :default => '.',
        :desc    => "The folder to scaffold into."
    def new
      #do thor stuff
      target_path=File.expand_path(File.join("#{CWD}", "#{options['path']}"))
      say "Generating Middleman-Ember-Scaffold in #{target_path}"
      scaffolder = MiddlemanEmberScaffold::Generators::Scaffold.new
      scaffolder.invoke :scaffold, [target_path]
    end
  end
  class Generate < Thor
    include Thor::Actions
    check_unknown_options!
    namespace :generate
    desc "generate [model/view/controller] [name]", "Generate models/view/controller/scaffold"
    method_option :type,
        :aliases => "-f",
        :required => true,
        :desc    => "The type of generator."
    method_option :file,
        :aliases => "-p",
        :required => true,
        :desc    => "Name of the generated file"

    def generate
      type = options['type']
      file = options['file']

      say "Generating #{type} for #{file}"
      scaffolder = MiddlemanEmberScaffold::Generators::Generate.new
      scaffolder.invoke :generate, [type, file]

    end

    def help
      say "You can generate views,models,controller and templates"
    end

  end



  class GenerateAlias < Generate
    namespace :g
  end
end