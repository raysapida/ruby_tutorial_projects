require 'rails_helper'

RSpec.describe Statistics, type: :model do
  it "total articles returns a count of all the articles for the blog" do
    Article.create title: "First", body: "Body"
    Article.create title: "Second", body: "Body"

    stats = Statistics.new
    expect(stats.total_articles).to eq(2)
  end

  it "total comments returns a count of all the comments for the blog" do
    article = Article.create title: "First", body: "Body"
    article.comments.create author_name: "Commenter", body: "New Comment"

    stats = Statistics.new
    expect(stats.total_comments).to eq(1)
  end
end
