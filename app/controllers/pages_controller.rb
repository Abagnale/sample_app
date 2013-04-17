class PagesController < ApplicationController
  
  def home
	@titre = "Home"
	@micropost = Micropost.new if signed_in?
	if signed_in?
		@feed_items = current_user.feed.paginate(:page => params[:page])
	else
		@feed_items = []
	end
  end

  def contact
	@titre = "Contact"
  end
  
  def about
	@titre = "About"
  end
  
  def help
	@titre = "Help"
  end
  
end
