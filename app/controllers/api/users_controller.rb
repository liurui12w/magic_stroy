class Api::UsersController < Api::ApplicationController
  skip_before_action :verify_authenticity_token, export: [:create]

  def create
    m_requires! [:username, :password]
    @user = User.find_by(username: params[:username])
    if @user
      if @user.valid_password?(params[:password])
        sign_in @user
        render_json([0, @user])
      else
        render_json([1, '密码输入错误'])
      end
    else
      render_json([1, '账户不存在'])
    end
  end

  def sign_out
    if current_user.reset_authentication_token!
      result =[0, '登出成功']
    else
      result =[1, '登出失败']
    end
    render_json(result)
  end

  def update_info
    if current_user.update!(user_params)
      result =[0, '用户信息修改成功']
    else
      result =[1, '用户信息修改失败']
    end
    render_json(result)
  end


  private

    def user_params
      params.permit(:avatar, :username, :mobile, :age, :gender, :birthday, :password)
    end
end
