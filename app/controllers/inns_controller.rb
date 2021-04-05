class InnsController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @inns = Inn.search(params[:search], params[:keyword], params[:key])

  end

  def index
    @user = User.find(current_user.id)
    @inns = current_user.inns
  end

  def new
    @inn = Inn.new
  end

  def create
    @inn = current_user.inns.new(params.require(:inn).permit(:name, :address, :price, :introduction, :image))
    if @inn.save
      binding.pry
      flash[:notice] = "新規宿を登録しました"
      redirect_to inn_path(current_user)
    else
      render "new"
    end
  end

  def show
    @inn = Inn.find(params[:id])
    @users = @inn.user
    @reserv =Reserv.new
  end

  def edit
  end

  def update

  end

  def destroy

  end
end
