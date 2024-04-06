# frozen_string_literal: true

require './lib/source'
require './lib/parser'
require 'magic_cloud'

source = Source.new
parser = Parser.new
parser.parse!(source.content)
# puts parser.words

words = parser.counts.slice(0, TOP_WORDS_NUM)
pp words
cloud = MagicCloud::Cloud.new(words, rotate: :free, scale: :sqrt, font_family: 'Unifont')
cloud.draw(500, 250).write('test.png')
