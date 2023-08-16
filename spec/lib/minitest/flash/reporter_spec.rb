# frozen_string_literal: true

require_relative '../../../spec_helper'
require_relative '../../../../lib/minitest/flash/reporter'

describe Minitest::Flash::Reporter do
  subject do
    Minitest::Flash::Reporter.new
  end

  describe :test_color do
    it "reports :green if no failures/errors occurred" do
      subject.instance_eval do
        def failures()=0
        def errors()=0
      end
      _(subject.test_color).must_equal :green
    end

    it "reports :red if failures occurred" do
      subject.instance_eval do
        def failures()=1
        def errors()=0
      end
      _(subject.test_color).must_equal :red
    end

    it "reports :red if errors occurred" do
      subject.instance_eval do
        def failures()=0
        def errors()=1
      end
      _(subject.test_color).must_equal :red
    end
  end
end
