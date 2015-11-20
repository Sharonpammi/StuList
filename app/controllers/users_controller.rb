class UsersController < ApplicationController
  before_action :signed_in_user, only:[:edit, :update]
  before_action :correct_user,   only:[:edit, :update]

  def show
    @user = User.find(params[:id])
    @listings = @user.listings.paginate(page: params[:page], per_page: 10)
    @messages = @user.messages.paginate(page: params[:page])
    @send_message = current_user.messages.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def new
  	 @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "WELCOME TO STULST!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username,
                                   :zipcode, :email, :password, :password_confirmation)
    end

    #before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
