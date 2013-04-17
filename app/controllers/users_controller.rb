class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :index, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy


  def new
	@user = User.new
  	@titre = "Inscription"
  end
  
  def show
	@user = User.find(params[:id])
	@microposts = @user.microposts.paginate(:page => params[:page])
	@titre = @user.nom
  end
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end
  
  def edit
    @titre = "Edition profil"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualise."
      redirect_to @user
    else
      @titre = "Edition profil"
      render 'edit'
    end
  end
  
  def destroy
    user = User.find(params[:id])
    flash[:success] = "Utilisateur " + user.nom + " supprime."
    user.destroy
    redirect_to users_path
  end 
  
  def index
    @titre = "Liste des utilisateurs"
    @users = User.paginate(:page => params[:page])
  end
  
  private 
    
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
end
