# frozen_string_literal: true

require './lib/source'
require './lib/parser'

source = Source.new
puts source.content

parser = Parser.new
puts parser.parse(source.content)
