require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "is valid with valid attributes" do
    expect(Post.new).to be_valid
  end

  it "is not valid without a name" do
	post = Post.new(name: nil)
	expect(post).to_not be_valid
  end

  it "is not valid without a description"

end