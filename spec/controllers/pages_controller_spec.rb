require 'spec_helper'

describe PagesController do

  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have a good title" do
      get 'home'
      response.should have_selector("title", :content => 
					"Simple App du Tutoriel Ruby on Rails | home")
    end
    
  end

  describe "GET 'contact'" do
    it "should be successful" do
		get 'contact'
      response.should be_success
    end
    
    it "should  have good title" do
		get 'contact'
		response.should have_selector( "title", :content =>
					"Simple App du Tutoriel Ruby on Rails | contact")
    end
    
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
	it "should  have good title" do
		get 'about'
		response.should have_selector( "title", :content =>
					"Simple App du Tutoriel Ruby on Rails | about")
    end
    
  end

end
