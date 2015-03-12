
class UsersController < ApplicationController
  respond_to :html, :js

  def create
    @email = params[:email]
    @password = params[:password]

    response = RestClient.post("http://recruiting-api.nextcapital.com/users",
      {"email" => @email, "password" => @password}.to_json,
      :content_type => :json,
      :accept => :json
      ) {|response, request, result| response }

    @response_code = response.code

    #response code should be 200 if successful
    puts "******response code - user#create ********"
    puts @response_code

    redirect_to create_session_path({email: @email, password: @password})
  end

end
