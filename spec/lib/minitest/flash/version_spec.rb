# frozen_string_literal: true

require_relative '../../../spec_helper'

describe Minitest::Flash::VERSION do
  it "must be defined" do
    _(Minitest::Flash::VERSION).wont_be_nil
  end
end
