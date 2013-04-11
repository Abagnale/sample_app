require 'spec_helper'

describe "LayoutLinks" do

  #it "devrait trouver une page Accueil a '/'" do
  #  get '/'
  #  response.should have_selector('title', :content => "Home")
 # end

  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an A Propos page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "devrait trouver une page aide a '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "devrait avoir une page d'inscription a '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Inscription")
  end
  
end
