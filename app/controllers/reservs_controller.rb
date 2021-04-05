class ReservsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservs = @user.reservs
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
    @reserv = current_user.reservs.new(params.require(:reserv).permit(:start_day, :end_day, :num_pepo, :fee, :inn_id))
    binding.pry
    if @reserv.save
      flash[:notice] = "新規予約を登録しました"
      redirect_to :lodg
    else
      render :lodg
    end
  end

  def update

  end

  def destroy

  end
end
