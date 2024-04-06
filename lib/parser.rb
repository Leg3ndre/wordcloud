# frozen_string_literal: true

require 'natto'
require './lib/const'

# Wrapper of natto (morphological analyzer)
class Parser
  def initialize
    option = DICT_PATH ? "-d #{DICT_PATH}" : nil
    @nm = Natto::MeCab.new(option)
  end

  def parse(str)
    @nm.parse str
  end
end
