# frozen_string_literal: true

require 'thor'
require 'tty-progressbar'

module Console
  module Util
    # Handle the application command line parsing
    # and the dispatch to various command objects
    #
    # @api public
    class CLI < Thor
      # Error raised by this runner
      Error = Class.new(StandardError)

      desc 'version', 'console-util version'
      def version
        require_relative 'version'
        puts "v#{Console::Util::VERSION}"
      end

      desc 'hw', 'Hello World!'
      def hw
        puts "Hello World!"
      end

      desc 'progress', 'Progress!'
      def progress
        bar = TTY::ProgressBar.new("downloading [:bar]", total: 30)
        30.times do
          sleep(0.1)
          bar.advance(1)
        end
      end

      map %w(--version -v) => :version
    end
  end
end
