# frozen_string_literal: true

require 'thor'
require 'tty-progressbar'
require 'tty-spinner'
require 'tty-table'
require 'tty-font'

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

      desc 'spinner', 'Spinner!'
      def spinner
        TTY::Spinner::FORMATS.each_pair { |key, value|

          spinner = TTY::Spinner.new("[:spinner] #{key.to_s} ...", format: key)

          spinner.auto_spin # Automatic animation with default interval

          sleep(2) # Perform task

          spinner.stop('Done!') # Stop animation
        }
      end

      desc 'table', 'Table!'
      def table
        table = TTY::Table.new header: ['h1', 'h2'], rows: [['a1', 'a2'], ['b1', 'b2']]

        table.render(:ascii)
      end

      desc 'font', 'Font!'
      def font
        font = TTY::Font.new(:standard)

        puts font.write('Hello World!')
      end

      map %w(--version -v) => :version
    end
  end
end
