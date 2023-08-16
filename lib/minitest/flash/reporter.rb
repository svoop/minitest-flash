# frozen_string_literal: true

module Minitest
  module Flash
    class Reporter < StatisticsReporter
      def report
        super
        begin
          `minitest-flash #{test_color}`
        rescue Errno::ENOENT
        end
      end

      def test_color
        errors == 0 && failures == 0 ? :green : :red
      end

      # When using the following methods together with `minitest-reporters`,
      # they are required.
      def add_defaults(defaults); end
      def before_test(test); end
      def after_test(test); end
    end
  end
end
