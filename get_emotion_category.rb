require_relative 'emotion_analyzer/emotion_analyzer'

puts ARGV[0]
puts EmotionAnalyzer.analyze(word: ARGV[0])
