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

  it "most popular returns the article with the most comments" do
    article = Article.create title: "First", body: "Body"
    article.comments.create author_name: "Commenter", body: "New Comment"

    article2 = Article.create title: "First", body: "Body"
    article2.comments.create author_name: "Commenter", body: "New Comment"
    article2.comments.create author_name: "Commenter", body: "Second Comment"

    stats = Statistics.new
    expect(stats.most_popular).to eq(article2)
  end

  it "article word counts returns total number of words across all articles" do
    pending("create fixtures or factories for articles")
    stats = Statistics.new
    expect(stats.article_word_counts).to eq(100)
  end

  it "article average word count returns average number of words across all articles" do
    pending("create fixtures or factories for articles")
    stats = Statistics.new
    expect(stats.article_average_word_count).to eq(10)
  end

  it "article max word count returns maximum number of words across all articles" do
    pending("create fixtures or factories for articles")
    stats = Statistics.new
    expect(stats.article_max_word_count).to eq(15)
  end

  it "article min word count returns minimum number of words across all articles" do
    pending("create fixtures or factories for articles")
    stats = Statistics.new
    expect(stats.article_min_word_count).to eq(8)
  end
end
