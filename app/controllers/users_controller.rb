class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def new

  end

  def create

  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    binding.pry
    @user = User.find(current_user.id)
  end

  def update
    binding.pry
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :email, :introduction, :image))
      flash[:notice] = "情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy

  end
end
