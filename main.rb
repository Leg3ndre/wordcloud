# frozen_string_literal: true

require './lib/source'
require './lib/parser'

source = Source.new
parser = Parser.new
parser.parse!(source.content)
puts parser.words
