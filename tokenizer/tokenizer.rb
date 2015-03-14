#!/usr/bin/ruby
# ++
# build on top of RMMSeg (http://rmmseg.rubyforge.org/)
# ++

class String
  def only_letters
    str = ''
    self.chars.each do |c|
      if CJKHelper.is_cjk(c)
        str += c
      elsif c.ord >= 97 && c.ord <= 122
        str += c
      elsif c.ord >= 65 && c.ord <= 90
        str += c
      end
    end
    str
  end
end

class Tokenizer
  def self.tokenize(text:)
    raise "Exception: no text given to Tokenizer" if text == nil
    clone = text.to_s.only_letters
    `echo #{clone} | rmmseg`.split(' ')
  end
end