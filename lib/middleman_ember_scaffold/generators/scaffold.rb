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
        Dir.chdir(destination_root)
        run_bundle
        bundle_command('exec middleman build')
      end



      #steal bundle command from rails app generator
      private
        def bundle_command(command)
          say_status :run, "bundle #{command}"

          # We are going to shell out rather than invoking Bundler::CLI.new(command)
          # because `mes new` loads the Thor gem and on the other hand bundler uses
          # its own vendored Thor, which could be a different version. Running both
          # things in the same process is a recipe for a night with paracetamol.
          #
          # We use backticks and #print here instead of vanilla #system because it
          # is easier to silence stdout in the existing test suite this way. The
          # end-user gets the bundler commands called anyway, so no big deal.
          #
          # We unset temporary bundler variables to load proper bundler and Gemfile.
          #
          # Thanks to James Tucker for the Gem tricks involved in this call.
          _bundle_command = Gem.bin_path('bundler', 'bundle')

          require 'bundler'
          Bundler.with_clean_env do
            print `"#{Gem.ruby}" "#{_bundle_command}" #{command}`
          end
        end

        def run_bundle
          bundle_command('install')
        end
    end
  end
end
