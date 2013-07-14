# spec/models/user.rb
require 'spec_helper'

describe User do
  before do
  	@user = FactoryGirl.create(:user, email: "lily1307@gmail.com", password_digest: "for testing")
  end
  subject{@user}
  it { should validate_uniqueness_of(:email) }
  it { should ensure_inclusion_of(:password).in_range(6..10) }
  it "is invalid without a password" do
  	FactoryGirl.build(:user, password:nil).should_not be_valid
  end
  it "is invalid without a email" do
  	FactoryGirl.build(:user, email:nil).should_not be_valid
  end
  it "is invalid with wrong email format" do
  	FactoryGirl.build(:user, email: "lily1309@", password: "wellington").should_not be_valid
  end
end
