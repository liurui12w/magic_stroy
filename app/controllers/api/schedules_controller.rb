class Api::SchedulesController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: [:show, :update, :destroy]

  def index
    optional! :page, default: 1
    optional! :per, default: 20, values: 1..100
    record = Schedule.all.ransack(q_params).result
    @record = Kaminari.paginate_array(record).page(page).per(per)
  end

  def create
    @record = Schedule.new(schedule_params)
    if @record.save
      result = [0, '成功']
    else
      result = [1, '失败']
    end
    render_json(result)
  end

  def update
    if @record.update!(schedule_params)
      result = [0, '修改成功']
    else
      result = [1, '修改失败']
    end
    render_json(result)
  end

  def destroy
    if @record.destroy
      result = [0, '删除成功']
    else
      result = [1, '删除失败']
    end
    render_json(result)
  end


  private

    def set_schedule
      @record = Schedule.find(params[:id])
    end

    def q_params
      if params[:q]
        params.require(:q).permit(:owntype_eq, :user_id_eq, :schedule_date_gt, :schedule_date_lteq)
      end
    end

    def schedule_params
      params.permit(:user_id, :owntype, :schedule_date, :remind_date, :start_date, :end_date, :status,
        :level, :category, :title, :remark, :describe, :place, :time_zone, :is_all_day)
    end
end
