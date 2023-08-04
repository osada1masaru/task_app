class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedules_total = Schedule.count
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo,))
    # binding.pry
    if @schedule.save
      # binding.pry
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      # binding.pry
      flash.now[:alert] = "スケジュールの登録に失敗しました"
      render "new",status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo,))
      flash[:notice] = "スケジュール更新しました"
      redirect_to :schedules
    else
      flash.now[:alert] = "スケジュールの更新に失敗しました"
      render "edit",status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end
end
