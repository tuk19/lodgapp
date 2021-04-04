class ReservsController < ApplicationController
  def index
    # binding.pry
    @reservs = current_user.reserv
    # @inns = @reserv.inns
    # @user = User.find(current_user.id)
    # @inns = current_user.inns
  end

  def new
    @reserv = Reserv.new
    @inn = Inn.find(params[:id])
    @user = @inn.users
  end

  def confirm
    @inn = Inn.find(params[:id])
    @reserv = Reserv.new(reserv_params)
    render :new if @reserv.invalid?
    @days = @reserv.end_day - @reserv.start_day
    @fee = @inn.price * @days * @reserv.num_pepo
  end

  def notice
    @reserv = Reserv.find(params[:id])
    @inn = @reserv.inns
  end

  def show
    @reservs = Reserv.find(current_user.id)
    @inns = @reserv.inns
  end

  def edit

  end

  def create
    @reserv = Reserv.new(params.require(:reserv).permit(:start_day, :end_day, :num_pepo, :fee))
    if @reserv.save
      flash[:notice] = "新規予約を登録しました"
      redirect_to :lodg
    else
      render "new"
    end
  end

  def update

  end

  def destroy

  end
end
