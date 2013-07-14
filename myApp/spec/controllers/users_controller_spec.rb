# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController do

  before :each do
	  request.env['HTTPS'] = 'on'
	  request.env['HTTP_REFERER'] = "https://test.host/users"
  end
  
  describe "post create" do
	  context "with valid attributes" do
		it "creates a new user" do
		user = FactoryGirl.create(:user, email: "apple07@gmail.com", password: "123456")
		expect{
			post :create, user: FactoryGirl.attributes_for(:user)
		  }.to change(User,:count).by(1)
		end
		
		it "redirects to the new user" do
		  post :create, user: FactoryGirl.attributes_for(:user)
		  response.should redirect_to :root
		end
	  end
	  
	  context "with invalid attributes" do
		it "re-renders the new method" do
		  user = FactoryGirl.create(:user)
		  post :create, user: FactoryGirl.attributes_for(:invalid_user)
		  response.should render_template :new
		end
	  end 
  end
end
