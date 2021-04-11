class InnsController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @inns = Inn.search(params[:search], params[:keyword])
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
    # binding.pry
    if @inn.save
      # binding.pry
      flash[:notice] = "新規宿を登録しました"
      redirect_to :inns
    else
      render "new"
    end
  end

  def show
    @inn = Inn.find(params[:id])
    @users = @inn.user
    @reserv =Reserv.new
    # binding.pry
  end

  def edit
  end

  def update

  end

  def destroy
    @inn = Inn.find(params[:id])
    @inn.destroy
    flash[:notice] = "宿を削除しました"
    redirect_to :inns
  end
end
