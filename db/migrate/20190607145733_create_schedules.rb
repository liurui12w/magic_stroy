class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id, comment: '用户id'

      t.string :owntype, default: 'schedule', comment: '类型'
      t.date :schedule_date, comment: '日程Date'
      t.datetime :remind_date, comment: '提醒时间'
      t.datetime :start_date, comment: '开始时间'
      t.datetime :end_date, comment: '结束时间'
      t.string :status, comment: '状态'
      t.string :level, comment: '级别'
      t.string :category, comment: '类别'
      t.string :title, comment: '标题'
      t.text :remark, comment: '备注'
      t.string :place, comment: '地点'
      t.string :time_zone, comment: '时区'
      t.boolean :is_all_day, default: false, comment: '是否一整天'

      t.timestamps
    end
  end
end
