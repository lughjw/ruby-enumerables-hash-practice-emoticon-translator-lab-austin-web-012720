# require modules here
require "yaml"

def load_library(file_path)
  temp = YAML.load_file(file_path)
  emoticons = {
    :get_meaning =>  {},
    :get_emoticon => {}
  }
  
  temp.each_pair do |meaning,emoticon|
    japanese_emoticon = emoticon[0]
    english_emoticon  = emoticon[1]
    emoticons[:get_meaning][english_emoticon]   = meaning.to_s
    emoticons[:get_emoticon][japanese_emoticon] = english_emoticon
  end
  
  emoticons
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  result = emoticons[:get_meaning][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found!"
  end
  
  result
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  result = emoticons[:get_emoticon][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  
  result
end