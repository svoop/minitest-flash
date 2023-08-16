# frozen_string_literal: true

require_relative 'flash'
require_relative 'flash/reporter'

module Minitest
  def self.plugin_flash_init(*)
    self.reporter << Minitest::Flash::Reporter.new
  end
end
