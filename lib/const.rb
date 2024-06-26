# frozen_string_literal: true

require 'dotenv/load'

DICT_PATH = ENV.fetch('MECAB_DICTIONARY_PATH')
SOURCE_PATH = ENV.fetch('SOURCE_TEXT_FILE_PATH')

PART_NOUN           = '名詞'
PART_VERB           = '動詞'
PART_ADJECTIVE      = '形容詞'
PART_ADVERB         = '副詞'
PART_AUXILIARY_VERB = '助動詞'
PART_PARTICLE       = '助詞'
PART_SYMBOL         = '記号'
PART_INTERJECTION   = '感動詞'
PART_OTHER          = 'その他'

PARSER_VALID_PARTS = [PART_NOUN].freeze
# PARSER_VALID_PARTS = [PART_NOUN, PART_VERB, PART_ADJECTIVE].freeze
IGNORE_WORDS = ['*', 'ん', 'の', 'こと', 'もの', 'わけ'].freeze
TOP_WORDS_NUM = ENV.fetch('TOP_WORDS_NUM', 100).to_i

OUTPUT_WIDTH = ENV.fetch('OUTPUT_WIDTH', 500).to_i
OUTPUT_HEIGHT = ENV.fetch('OUTPUT_HEIGHT', 250).to_i
OUTPUT_DIRECTORY = ENV.fetch('OUTPUT_DIRECTORY', 'output')
