ActiveAdmin.register User do
  permit_params :username, :password, :password_confirmation, :mobile

  index do
    selectable_column
    id_column
    column "手机号",:mobile
    column "名字",:username
    column "创建时间",:created_at
    actions
  end

  filter :mobile
  filter :username

  form do |f|
    f.inputs "账号" do
      f.input :mobile, :label=> "手机号"
      f.input :username, :label=> "姓名"
      f.input :password, :label=> "密码"
      f.input :password_confirmation, :label=> "确认密码"
    end
    f.actions
  end


end
