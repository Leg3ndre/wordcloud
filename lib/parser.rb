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
      @words.push word_formatted(node) if valid?(node)
    end
  end

  def top_words
    @words.group_by { |word| word[:identifier] }
          .map { |_feature, group| [group.first[:original], group.count] }
          .sort_by { |count| count[1] }
          .reverse
  end

  private

  def word_formatted(node)
    original_form = original_form(node)
    {
      original: original_form,
      identifier: "#{original_form}:#{node.feature}",
    }
  end

  def valid?(node)
    return false if IGNORE_WORDS.include?(original_form(node))

    PARSER_VALID_PARTS.include?(part_of_speech(node))
  end

  def part_of_speech(node)
    node.feature.split(',')[0]
  end

  def original_form(node)
    node.feature.split(',')[6]
  end
end
