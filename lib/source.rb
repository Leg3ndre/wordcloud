# frozen_string_literal: true

require './lib/const'

# Source of wordcloud
class Source
  attr_reader :content

  def initialize
    @content = File.read(SOURCE_PATH)
    sanitize!
  end

  private

  def sanitize!
    @content.gsub!(/(ほ|お)ォ/) { "#{Regexp.last_match(1)}お" }
    @content.gsub!(/(あ|か|さ|だ|な|ま|や|～)ぁ/) { "#{Regexp.last_match(1)}あ" }
    @content.gsub!(/[！？]+/, '。')
    @content.gsub!(/\.{3}/, '')
    @content.tr!('～', 'ー')
  end
end
