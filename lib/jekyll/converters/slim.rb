module Jekyll
  module Converters
    class Slim < Converter
      safe :true

      DEFAULT_CONFIGURATION = {
        'slim_ext' => 'slim'
      }

      def initialize(config = {})
        @config = Jekyll::Utils.deep_merge_hashes(DEFAULT_CONFIGURATION, config)
        @setup = false
      end

      def setup
        return if @setup
        require 'slim'
        @setup = true
      rescue LoadError
        STDERR.puts 'You are missing a Slim library. Please run:'
        STDERR.puts '  $ [sudo] gem install slim'
        raise Errors::FatalException.new("Missing dependency: slim")
      end

      def extname_list
        @extname_list ||= @config['slim_ext'].split(',').map { |e| ".#{e}" }
      end

      def matches(ext)
        extname_list.include? ext.downcase
      end

      def output_ext(ext)
        ".html"
      end

      def convert(content)
        setup

        
      end
    end
  end
end
