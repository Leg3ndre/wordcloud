# frozen_string_literal: true

require './lib/const'

# Source of wordcloud
class Source
  attr_reader :content

  def initialize
    @content = File.read(SOURCE_PATH)
  end
end
