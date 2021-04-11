class ReservsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @reservs = @user.reservs
  end

  def new
    @reserv = Reserv.new
    @inn = Inn.find(params[:id])
    @user = @inn.users
    # binding.pry
  end

  def confirm
    @reserv = current_user.reservs.new(params.require(:reserv).permit(:start_day, :end_day, :num_pepo, :fee, :inn_id))
    @inn = @reserv.inn
    @users = @inn.user
    # binding.pry
    if @reserv.invalid?
      render "inns/show"
    else
      @days = (@reserv.end_day - @reserv.start_day).to_int
      @fee = @inn.price * @days * @reserv.num_pepo
    end
  end

  def notice
    @user = User.find(current_user.id)
    @reserv = current_user.reservs.last
    @inn = @reserv.inn
    flash[:notice] = "Reservatioin was succsessfully created."
  end

  def show
    @user = User.find(current_user.id)
    @reserv = current_user.reservs.last
    @inn = @reserv.inn
    flash[:notice] = "Reservatioin was succsessfully created."
  end

  def edit

  end

  def create
    @reserv = current_user.reservs.new(params.require(:reserv).permit(:start_day, :end_day, :num_pepo, :fee, :inn_id))
    # binding.pry
    if params[:back]
      @inn = @reserv.inn
      @users = @inn.user
      render "inns/show"
    elsif @reserv.save
      flash[:notice] = "新規予約を登録しました"
      redirect_to reservs_notice_path
    else
      flash[:notice] = "予約できませんでした"
      render "lodg/index"
    end
  end

  def update

  end

  def destroy
    @reserv = Reserv.find(params[:id])
    @reserv.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :reservs
  end
end
