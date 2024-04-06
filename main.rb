# frozen_string_literal: true

require './lib/source'
require './lib/parser'
require 'magic_cloud'

output_filename = ARGV[0] || 'test.png'
output_path = "#{OUTPUT_DIRECTORY}/#{output_filename}"

source = Source.new
parser = Parser.new
parser.parse!(source.content)

top_words = parser.top_words.slice(0, TOP_WORDS_NUM)
pp top_words

cloud = MagicCloud::Cloud.new(
  top_words,
  rotate: :none,
  scale: :sqrt,
  font_family: 'IPA明朝'
)
cloud.draw(OUTPUT_WIDTH, OUTPUT_HEIGHT).write(output_path)
