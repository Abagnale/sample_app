require 'spec_helper'

describe UsersController do

	render_views

	before (:each) do
		@base_title = "Simple App du Tutoriel Ruby on Rails | "
	end

	describe "GET 'new'" do
		it "returns http success" do
			get 'new'
			response.should be_success
		end

		it "should have good title" do
		get 'new'
		response.should have_selector("title", :content =>
						@base_title + "Inscription")
		end
	end
	
	
  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "devrait russir" do
      get :show, :id => @user
      response.should be_success
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
        it "devrait avoir le bon titre" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.nom)
    end

    it "devrait inclure le nom de l'utilisateur" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.nom)
    end

    it "devrait avoir une image de profil" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

end
