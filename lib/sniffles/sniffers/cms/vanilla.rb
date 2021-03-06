module Sniffles
  module Sniffers
    class Vanilla
      include HTML

      attr_accessor :doc
      attr_reader :output

      def initialize(response_body)
        @output = {}
        parse(response_body) && process_document
      end

      def process_document
        @output[:found] = found?
      end

      private
      def found?
        text_match?('//a[@href="http://vanillaforums.org/"]/text()', 'Vanilla Forums')
      end
    end
  end
end
