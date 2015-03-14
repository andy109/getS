class Readability
  def self.content_of_article(url:)
    run_path = File.dirname(File.absolute_path(__FILE__))
    `#{run_path}/get_article_content.js #{url}`.chomp
  end
end
