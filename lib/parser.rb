# frozen_string_literal: true

require 'natto'
require './lib/const'

# Wrapper of natto (morphological analyzer)
class Parser
  attr_reader :words

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

  def top_words
    @words.group_by(&:feature)
          .map { |_feature, group| [group.first.surface, group.count] }
          .sort_by { |count| count[1] }
          .reverse
  end

  private

  def part_of_speech(node)
    node.feature.split(',')[0]
  end
end
