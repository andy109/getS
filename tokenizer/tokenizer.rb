#!/usr/bin/ruby
# ++
# build on top RMMSeg (http://rmmseg.rubyforge.org/)
# ++

class Tokenizer
  def self.tokenize(text:)
    raise "Exception: no text given to Tokenizer" if text == nil
    `echo #{text} | rmmseg`.split(' ')
  end
end
