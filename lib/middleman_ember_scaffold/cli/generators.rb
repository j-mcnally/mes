module MiddlemanEmberScaffold::Cli
	class Generators < Thor
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
		  	require "middleman_ember_scaffold/generators/scaffold"
		  	scaffolder = MiddlemanEmberScaffold::Generators::Scaffold.new
		  	scaffolder.invoke :scaffold, [target_path]
		  	
		  end
	    end
end