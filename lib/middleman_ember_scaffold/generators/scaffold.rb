module MiddlemanEmberScaffold
  module Generators
	class Scaffold < Thor
	  include Thor::Actions
	  def self.source_root
	  	File.expand_path(File.dirname(__FILE__), "../template")
	  end

	  desc "build scaffold", "Build a scaffold for a Middleman Ember Project"
	  def scaffold(*args)
	  	destination_root=args[0]
	  	src = File.expand_path(File.join(File.dirname(__FILE__), "../template"))
	  	directory(src, destination_root)
	  	#puts 'Running bundle install.......'
	  	#puts %x['cd #{destination_root}; bundle install']
	  	#puts 'Building scaffold....'
	  	#puts %x['cd #{destination_root}; middleman build']
	  end

	end
  end
end
