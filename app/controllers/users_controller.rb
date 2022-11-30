class UsersController < ApplicationController
  before_action -> { authorize! User }

  def new
    @user = User.new
  end

  def create
    @user = create_user.user 

    if create_user.success?
      redirect_to root_path, notice: "You've successfully signed up!"
    else
      render :new, notice: "Something went wrong. Try again"
    end
  end

  private

  def create_user
    @create_user ||=
      Users::Create.call(user_params: user_params)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
