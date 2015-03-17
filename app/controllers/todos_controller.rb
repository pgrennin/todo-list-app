class TodosController < ApplicationController
  respond_to :html, :js

  def new
  end

  def create
    @user_id = session[:user_id]
    # @api_token = session[:api_token]
    @todo = params[:description]
    # api request for creating a new todo
    # response = RestClient.post("http://recruiting-api.nextcapital.com/users/#{@user_id}/todos",
    #           { "api_token" => @api_token, "todo" => {"description" => "#{@todo}"}}.to_json,
    #           :content_type => :json,
    #           :accept => :json){|response, request, result| response }

    # @response_code = response.code
    # puts "*********** response code todos#create ***********"
    # puts @response_code

    # api request for all retrieving all users' todos
    # response = RestClient.get "http://recruiting-api.nextcapital.com/users/#{@user_id}/todos.json?api_token=#{@api_token}",
    #           :content_type => :json,
    #           :accept => :json
    # @response_hash = JSON.parse(response)

    respond_to do |format|
          format.html {render nothing: true}
          format.js {render 'create.js.erb'}
    end
  end

  def index
    @user_id = session[:user_id]
    @email = session[:email]
    @api_token = session[:api_token]
    response = RestClient.get "http://recruiting-api.nextcapital.com/users/#{@user_id}/todos.json?api_token=#{@api_token}",
              :content_type => :json,
              :accept => :json
    @response_hash = JSON.parse(response)
  end

  def update
    @user_id = session[:user_id].to_s
    @api_token = session[:api_token]
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]

    response = RestClient.put("http://recruiting-api.nextcapital.com/users/#{@user_id}/todos/#{@todo_id}",
              {"api_token"=>@api_token, "todo"=> {"description"=> @description, "is_complete"=> @is_complete}}.to_json,
              :content_type => :json,
              :accept => :json){|response, request, result| response }

   @response_hash = JSON.parse(response)

   @response_code = response.code

   puts "***********response code - todo#update***********"
   puts @response_code

  end

  def edit_description
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]
  end


end
