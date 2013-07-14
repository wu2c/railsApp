# spec/controllers/newsarticles_controller_spec.rb
require 'spec_helper'

describe NewsarticlesController do
render_views

  before :each do
	  request.env['HTTPS'] = 'on'
	  @user = FactoryGirl.create(:user)
	  session[:user_id] = @user.id
  end
 
  describe "GET #index" do
		it "loads all of the newsarticles into @newsarticles" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  get :index
		  assigns(:newsarticles).should == [newsarticle]
		end
  end
  
  describe "GET #show" do
      context "with newsarticles" do
		  it "assigns the requested newsarticle to @newsarticle" do
			newsarticle = FactoryGirl.create(:newsarticle)
			get :show, id: newsarticle
			assigns(:newsarticle).should == newsarticle
		  end
	  end
	  
	 context "with comments" do
		it "loads all comments with a @newsarticle" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  comment = FactoryGirl.create(:comment, :newsarticle=> newsarticle)
		  newsarticle.comments << comment
		  get :show, id: newsarticle
		  newsarticle.comments.should == [comment]
		end
	end
  end
  
  describe "post create" do
	  context "with valid attributes" do
		it "creates a new newsarticle" do
		newsarticle = FactoryGirl.create(:newsarticle)
		  expect{
			post :create, newsarticle: FactoryGirl.attributes_for(:newsarticle)
		  }.to change(Newsarticle,:count).by(1)
		end
		
		it "redirects to the new newsarticle" do
		  post :create, newsarticle: FactoryGirl.attributes_for(:newsarticle)
		  response.should redirect_to Newsarticle.last
		end
	  end
	  
	  context "with invalid attributes" do
		it "re-renders the new method" do
		  post :create, newsarticle: FactoryGirl.attributes_for(:invalid_newsarticle)
		  response.should redirect_to Newsarticle.first
		end
	  end 
  end

  describe 'PUT update' do
	  context "valid attributes" do
		it "located the requested @newsarticle" do  
		newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, newsarticle: FactoryGirl.attributes_for(:newsarticle) 
		  assigns(:newsarticle).should == newsarticle      
		end
	  
		it "changes @newsarticle's attributes" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, 
		  newsarticle: FactoryGirl.attributes_for(:newsarticle, name: "lily1307@gmail.com",title: "Wellington's weather through this week", article: "It was sunny.")
		  newsarticle.reload
		  newsarticle.title.should == "Wellington's weather through this week"
		  newsarticle.article.should == "It was sunny."
		end
	  
		it "redirects to the updated newsarticle" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, newsarticle: FactoryGirl.attributes_for(:newsarticle)
		  response.should redirect_to @newsarticle
		end
	  end
	  
	  context "invalid attributes" do
		it "locates the requested @newsarticle" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, newsarticle: FactoryGirl.attributes_for(:invalid_newsarticle)
		  assigns(:newsarticle).should == newsarticle    
		end
		
		it "does not change @newsarticle's attributes" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, 
		  newsarticle: FactoryGirl.attributes_for(:newsarticle, name: "lily1307@gmail.com",title: nil, article: nil)
		  newsarticle.reload 
		  newsarticle.title.should_not == nil
		  newsarticle.article.should == nil
		end
		
		it "re-renders the edit method" do
		  newsarticle = FactoryGirl.create(:newsarticle)
		  put :update, id: newsarticle, newsarticle: FactoryGirl.attributes_for(:invalid_newsarticle)
		  response.should render_template :edit
		end
	  end
  end

  describe 'DELETE destroy' do
	  before :each do
		@newsarticle = FactoryGirl.create(:newsarticle)
	  end
	  
	  it "deletes the newsarticle" do
		expect{
		  delete :destroy, id: @newsarticle        
		}.to change(Newsarticle,:count).by(-1)
	  end
		
	  it "redirects to newsarticles#index" do
		delete :destroy, id: @newsarticle
		response.should redirect_to newsarticles_url
	  end
  end
  
  describe 'Access with authentication' do	
  	  before :each do
	  	request.env['HTTP_REFERER'] = "https://test.host/newsarticles"
	  end
	  
	  it "denies update to user" do 
	 	newsarticle = FactoryGirl.create(:newsarticle2)
		put :update, id: newsarticle, 
		newsarticle: FactoryGirl.attributes_for(:newsarticle, name: "lily1308@gmail.com",title: "Wellington's weather through this week", article: "It was sunny.")
		newsarticle.reload
		newsarticle.title.should_not == "Wellington's weather through this week"
		newsarticle.article.should_not == "It was sunny."
	  end
	  
	  it "goes back when denies update to user" do 
	 	newsarticle = FactoryGirl.create(:newsarticle2)
		put :update, id: newsarticle, 
		newsarticle: FactoryGirl.attributes_for(:newsarticle, name: "lily1308@gmail.com",title: "Wellington's weather through this week", article: "It was sunny.")
		newsarticle.reload
		response.should redirect_to :back
	  end
	  
	  it "denies delete to user" do
	    newsarticle = FactoryGirl.create(:newsarticle2)
		delete :destroy, id: newsarticle
		expect{
		  delete :destroy, id: newsarticle        
		}.to_not change(Newsarticle,:count)
	  end
	  
	  it "redirect back when denies delete to user" do
	    newsarticle = FactoryGirl.create(:newsarticle2)
		delete :destroy, id: newsarticle
		response.should redirect_to :back
	  end
  end



end
