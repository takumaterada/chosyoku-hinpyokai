class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render :edit
    else
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
