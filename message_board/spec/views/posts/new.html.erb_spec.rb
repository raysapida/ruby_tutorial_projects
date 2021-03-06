require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  let(:user) { User.create(email: "example@rails.com",
                           password: "password",
                           password_confirmation: "password") }
  before(:each) do
    assign(:post, Post.new(
      :title => "MyText",
      :content => "MyText",
      :user => user
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "textarea#post_title[name=?]", "post[title]"

      assert_select "textarea#post_content[name=?]", "post[content]"
    end
  end
end
