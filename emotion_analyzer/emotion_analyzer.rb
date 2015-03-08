class EmotionAnalyzer
  require 'json'
  
  CATEGORY_MAP = {
    'PA' => '乐',
    'PE' => '乐',
    'PD' => '好',
    'PH' => '好',
    'PG' => '好',
    'PB' => '好',
    'PK' => '好',
    'NA' => '怒',
    'NB' => '哀',
    'NJ' => '哀',
    'NH' => '哀',
    'PE' => '哀',
    'NI' => '惧',
    'NC' => '惧',
    'NG' => '惧',
    'NE' => '恶',
    'ND' => '恶',
    'NN' => '恶',
    'NK' => '恶',
    'NL' => '恶',
    'PC' => '惊',
  }


  def self.analyze(word:)
    JSON.parse(File.read("/Users/huangmh/Codes/nextNewsTools/emotion_analyzer/emotion_database.json"))[word]
  end

  def self.analyze_brief(word:)
    ret = JSON.parse(File.read("/Users/huangmh/Codes/nextNewsTools/emotion_analyzer/emotion_database.json"))[word]
    if ret
      if ret['emotion_polarity'].to_i == 2
        factor = -1
      else
        factor = ret['emotion_polarity'].to_i
      end

      {
        "word" => word,
        "category" => CATEGORY_MAP[ret['emotion_category']],
        "category_" => ret['emotion_category'],
        "polarity" => ret['emotion_polarity'],
        "level" => ret['emotion_level'].to_i * factor
      }
    end
  end
end
