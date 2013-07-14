# spec/models/newsarticle.rb
require 'spec_helper'

describe Newsarticle do
  it "can create a newsarticle" do
  	FactoryGirl.create(:newsarticle).should be_valid
  end
  it "cannot create a newsarticle without username" do
  	FactoryGirl.build(:newsarticle, name:nil).should_not be_valid
  end
  it "is invalid without a title" do
  	FactoryGirl.build(:newsarticle, title:nil).should_not be_valid
  end
  before do
  	@newsarticle = FactoryGirl.build(:newsarticle, name: "lily1307@gmail.com", title: "for")
  end
  subject{@newsarticle}
  it { should ensure_length_of(:title).is_at_least(5) }
  it "is valid without a article" do
  	FactoryGirl.build(:newsarticle, article:nil).should be_valid
  end
  it { should have_many(:comments) }
end
