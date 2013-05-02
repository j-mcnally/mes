# Require thor since that's what the who CLI is built around
require 'thor'
require "thor/group"

# CLI Module
module MiddlemanEmberScaffold

  module Cli

    # The base task from which everything else etends
    class Base < Thor
      class << self
        def start(*args)
          # Change flag to a module
          ARGV.unshift("help") if ARGV.delete("--help")

          unless ARGV[1].nil? || ARGV[1].start_with?("-")
          	ARGV.push ARGV[1]
          	ARGV[1] = '-p'
          end

          # Default command is server
          if ARGV[0] != "help" && (ARGV.length < 1 || ARGV.first.include?("-"))
            ARGV.unshift("help")
          end
          super
        end
      end

      desc "version", "Show version"
      def version
        require 'middleman_ember_scaffold/version'
        say "mes #{MiddlemanEmberScaffold::VERSION}"
      end



      # Override the Thor help method to find help for subtasks
      # @param [Symbol, String, nil] meth
      # @param [Boolean] subcommand
      # @return [void]
      def help(meth = nil, subcommand = false)
        if meth && !self.respond_to?(meth)
          klass, task = Thor::Util.find_class_and_task_by_namespace("#{meth}:#{meth}")
          klass.start(["-h", task].compact, :shell => self.shell)
        else
          list = []
          Thor::Util.thor_classes_in(MiddlemanEmberScaffold::Cli).each do |thor_class|
            list += thor_class.printable_tasks(false)
          end
          list.sort!{ |a,b| a[0] <=> b[0] }

          shell.say "Tasks:"
          shell.print_table(list, :ident => 2, :truncate => true)
          shell.say
        end
      end

      # Intercept missing methods and search subtasks for them
      # @param [Symbol] meth
      def method_missing(meth, *args)
        meth = meth.to_s

        if self.class.map.has_key?(meth)
          meth = self.class.map[meth]
        end

        klass, task = Thor::Util.find_class_and_task_by_namespace("#{meth}:#{meth}")

        if klass.nil?
          tasks_dir = File.join(Dir.pwd, "tasks")

          if File.exists?(tasks_dir)
            Dir[File.join(tasks_dir, "**/*_task.rb")].each { |f| require f }
            klass, task = Thor::Util.find_class_and_task_by_namespace("#{meth}:#{meth}")
          end
        end

        if klass.nil?
          raise Thor::Error.new "There's no '#{meth}' command for mes. Try 'mes help' for a list of commands."
        else
          args.unshift(task) if task
          klass.start(args, :shell => self.shell)
        end
      end
    end
  end
end


require "middleman_ember_scaffold/cli/generators"
