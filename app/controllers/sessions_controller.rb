class SessionsController < ApplicationController
  def new
  end

  def create
    puts params.inspect
    @email = params[:email]
    @password = params[:password]
    # creates a new user session using the api
    # Don't raise exceptions but return the response
    response = RestClient.post("http://recruiting-api.nextcapital.com/users/sign_in", {"email" => @email, "password" => @password}.to_json, :content_type => :json, :accept => :json){|response, request, result| response }

    @response_code = response.code
    response_hash = JSON.parse(response)

    session[:email] = response_hash["email"]
    session[:user_id] = response_hash["id"]
    session[:api_token] = response_hash["api_token"]

    # Driver Tests
    puts "***********response code - sessions#create***********"
    puts @response_code

    if @response_code == 200
      redirect_to todos_path
    else
      # format.html { render action: "new" }
      respond_to do |format|
        format.js {render "login_error.js.erb"}
        # format.html {redirect_to root_path}
      end
    end


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
