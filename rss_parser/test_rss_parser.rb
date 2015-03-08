require_relative '163_rss_parser'

describe RSSParser do
  before do
    @parser = RSSParser.new
  end

  it "should raise an error" do
    expect { @parser.parse }.to raise_error
  end

  it "should get some news" do
    expect(@parser.parse(url:"http://news.163.com/special/00011K6L/rss_newstop.xml")).to equal("a")
  end
end
