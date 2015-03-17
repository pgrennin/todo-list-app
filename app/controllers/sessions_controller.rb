class SessionsController < ApplicationController
  def new
  end

  def index

  end

  def create
    # raise params.inspect
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email: @email)
    if @user.password == @password #success
      session[:user_id] = @user.id
      redirect_to todos_path
    else # incorrect username/password raise error message
      flash[:error] = "Username or Password invalid"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
