class SessionsController < ApplicationController
  def new
  end

  def index

  end

  def create
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email: @email)
    session[:user_id] = @user.id
    redirect_to todos_path
  end

  def destroy
    api_token = session[:api_token].to_s
    user_id = session[:user_id].to_i
    response = RestClient.delete("http://recruiting-api.nextcapital.com/users/sign_out", :params => {:api_token => api_token, :user_id => user_id}){|response, request, result| response }
    @response_code = response.code

    puts "***********response code - sessions#destroy ***********"
    puts @response_code
    reset_session
    redirect_to root_path
  end
end
