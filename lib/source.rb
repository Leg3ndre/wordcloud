# frozen_string_literal: true

require './lib/const'

# Source of wordcloud
class Source
  attr_reader :content

  def initialize
    @content = File.read(SOURCE_PATH)
  end

  private

  def sanitize
    @content.gsub!(/(ほ|お)ォ/) { "#{$1}お" }
    @content.gsub!(/(あ|か|さ|だ|な|ま|や|～)ぁ/) { "#{$1}あ" }
    @content.gsub!(/[！？]+/, '。')
    @content.gsub!(/\.{3}/, '')
    @content.tr!('～', 'ー')
  end
end
