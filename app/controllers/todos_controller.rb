class TodosController < ApplicationController
  respond_to :html, :js

  def new
  end

  def create
    current_user.todos.create(description: params[:description], is_complete: false)
    @todos = current_user.todos.order(position: :asc)
  end

  def index
    @todos = current_user.todos.order(position: :asc)
  end

  def update_description
    @todos = current_user.todos.order(position: :asc)
    @description = params[:description]
    @todo = Todo.find(params[:todo_id])
    @todo.update(description: @description)
  end

  def update_status
    @todo_id = params[:todo_id]
    @is_complete = params[:is_complete]
    @todo = Todo.find(@todo_id)
    @todo.update(is_complete: @is_complete)
    @todos = current_user.todos.order(position: :asc)
    # render :nothing => true
  end

  def destroy
    current_user.todos.find(params[:id]).destroy
    @todos = current_user.todos.order(position: :asc)
  end


  def edit_description
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]
  end

  def update_order
    @todos = current_user.todos
    @todos.each do |todo|
      todo.position = params["todo-row"].index(todo.id.to_s) + 1
      todo.save
    end    
    render :nothing => true
  end

end
