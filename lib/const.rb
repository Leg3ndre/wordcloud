# frozen_string_literal: true

require 'dotenv/load'

DICT_PATH = ENV.fetch('MECAB_DICTIONARY_PATH')
SOURCE_PATH = ENV.fetch('SOURCE_TEXT_FILE_PATH')
