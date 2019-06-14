ActiveAdmin.register Schedule do

  permit_params :user_id, :owntype, :schedule_date, :remind_date, :start_date, :end_date,
   :status, :level, :category, :title, :remark, :place, :time_zone, :is_all_day


  index do
    selectable_column
    id_column
    column "用户", :user
    column "类型", :owntype
    column "标题", :title
    # column "备注", :remark
    column "日程Date", :schedule_date
    column "提醒时间", :remind_date
    column "开始时间", :start_date
    column "结束时间", :end_date
    column "状态", :status
    column "级别", :level
    column "类别", :category
    # column "地点", :place
    # column "时区", :time_zone
    # column "是否一整天", :is_all_day
    actions
  end


  filter :owntype, :label=> "类型"
  filter :start_date, as: :date_time_range

  form do |f|
    f.inputs "日程/清单" do
      f.input :user_id, :label=> "用户id", :as => :select, collection: User.all.map{|s| ["#{s.username}", s.id]}
      f.input :owntype, :label=> "类型", :as => :select, :collection => ["Schedule","DetailedList"], refreshes: :schedule_date
      f.input :schedule_date, :label=> "日程Date", as: :date_time_picker,
                         picker_options: {
                           min_date: Date.current - 2.days,
                           timepicker: false
                         }
      f.input :title, :label=> "标题"
      f.input :remind_date, :label=> "提醒时间", as: :date_time_picker
      f.input :start_date, :label=> "开始时间", as: :date_time_picker
      f.input :end_date, :label=> "结束时间", as: :date_time_picker
      f.input :status, :label=> "状态"
      f.input :level, :label=> "级别", :as => :select, :collection => ["重要且紧急","重要不紧急","紧急不重要","不重要不紧急"]
      f.input :category, :label=> "类别", :as => :select, :collection => ["私事","工作","健康","学习","娱乐"]
      f.input :place, :label=> "地点"
      # f.input :time_zone, :label=> "时区"
      f.input :is_all_day, :label=> "是否一整天"
      f.input :remark, :label=> "备注"
    end
    f.actions
  end
end
