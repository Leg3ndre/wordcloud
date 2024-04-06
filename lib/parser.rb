# frozen_string_literal: true

require 'natto'
require './lib/const'

# Wrapper of natto (morphological analyzer)
class Parser
  def initialize
    option = DICT_PATH ? "-d #{DICT_PATH}" : nil
    @nm = Natto::MeCab.new(option)
    @words = []
  end

  def parse!(str)
    @nm.parse(str) do |node|
      @words.push node if PARSER_VALID_PARTS.include?(part_of_speech(node))
    end
  end

  def words
    @words.map(&:surface)
  end

  private

  def part_of_speech(node)
    node.feature.split(',')[0]
  end
end
