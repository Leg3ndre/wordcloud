# frozen_string_literal: true

require 'natto'
require './lib/const'
require './lib/source'

option = DICT_PATH ? "-d #{DICT_PATH}" : nil
nm = Natto::MeCab.new(option)

puts nm.parse('8月3日に放送された「中居正広の金曜日のスマイルたちへ」(TBS系)で、1日たった5分でぽっこりおなかを解消するというダイエット方法を紹介。キンタロー。のダイエットにも密着。')

source = Source.new
puts source.content
