class TodosController < ApplicationController
  respond_to :html, :js

  def new
  end

  def create
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    @user.todos.create(description: params[:description], is_complete: false)
    @todos = @user.todos

    respond_to do |format|
          format.html {render nothing: true}
          format.js {render 'create.js.erb'}
    end
  end

  def index
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    @todos = @user.todos
    # render 'welcome/index.html.erb'

    # render 'index'
    # respond_to do |format|
    #       format.html {render 'index.html.erb'}
    #       format.js {render 'index.js.erb'}
    # end
    # redirect_to

  end

  def update
    @user_id = session[:user_id]
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]

    @todo = Todo.find(@todo_id)
    @todo.update(description: @description, is_complete: @is_complete)


   #  response = RestClient.put("http://recruiting-api.nextcapital.com/users/#{@user_id}/todos/#{@todo_id}",
   #            {"api_token"=>@api_token, "todo"=> {"description"=> @description, "is_complete"=> @is_complete}}.to_json,
   #            :content_type => :json,
   #            :accept => :json){|response, request, result| response }

   # @response_hash = JSON.parse(response)

   # @response_code = response.code

   # puts "***********response code - todo#update***********"
   # puts @response_code

  end

  def destroy
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    @todos = @user.todos
    # raise params.inspect
    Todo.find(params[:id]).destroy
    # redirect_to todos_path
    # respond_to do |format|
    #       format.html {render nothing: true}
    #       format.js {render 'destroy.js.erb'}
    # end
  end


  def edit_description
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]
  end


end
