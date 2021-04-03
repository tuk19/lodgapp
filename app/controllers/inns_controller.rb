class InnsController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @inns = Inns.search(params[:search])
  end

  def index

  end

  def new
    @inn = Inn.new
  end

  def create
    # binding.pry
    # current_user.inns.create(post_params)
    # redirect_to :inns
    @inn = Inn.new(params.require(:inn).permit(:name, :address, :price, :introduction, :image))
    binding.pry
    if @inn.save
      flash[:notice] = "新規宿を登録しました"
      redirect_to :inns
    else
      render "new"
    end
  end

  private
  def post_params
    params.require(:inn).permit(:name, :address, :price, :introduction, :image)
  end

  def show
    @user = User.find(current_user.id)
    @inns = @user.inns
  end

  def edit
  end

  def update

  end

  def destroy

  end
end
