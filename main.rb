# frozen_string_literal: true

require 'natto'
require 'dotenv/load'

DICT_PATH = ENV.fetch('MECAB_DICTIONARY_PATH')

option = DICT_PATH ? "-d #{DICT_PATH}" : nil
nm = Natto::MeCab.new(option)
puts nm

puts nm.parse('8月3日に放送された「中居正広の金曜日のスマイルたちへ」(TBS系)で、1日たった5分でぽっこりおなかを解消するというダイエット方法を紹介。キンタロー。のダイエットにも密着。')
