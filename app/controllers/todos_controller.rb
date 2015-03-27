class TodosController < ApplicationController
  respond_to :html, :js

  def new
  end

  def create
    current_user.todos.create(description: params[:description], is_complete: false)
  end

  def index
  end

  def update
    @description = params[:description]
    @todo = Todo.find(params[:todo_id])
    @todo.update(description: @description)
  end

  def update_status
    @todo_id = params[:todo_id]
    @is_complete = params[:is_complete]
    @todo = Todo.find(@todo_id)
    @todo.update(is_complete: @is_complete)
    render :nothing => true
  end


  def destroy
    current_user.todos.find(params[:id]).destroy
  end


  def edit_description
    @todo_id = params[:todo_id]
    @description = params[:description]
    @is_complete = params[:is_complete]
  end


end
