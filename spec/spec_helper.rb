# frozen_string_literal: true

gem 'minitest'

require 'pathname'
require 'debug'

require 'minitest/autorun'
require Pathname(__dir__).join('..', 'lib', 'minitest', 'flash')

require 'minitest/focus'
