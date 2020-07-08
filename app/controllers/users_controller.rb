class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = (current_user if sign_in?)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name))
    flash.notice = "User #{@user.name} Updated!"
    redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
    flash.notice = "User #{@user.name} Deleted!"
    redirect_to root_path
    else
    render :root
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
