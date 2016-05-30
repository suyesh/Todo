class TodosController < ApplicationController
  before_action :authenticate_user!
  def index
    @todos = current_or_guest_user.todos.all
    @todo = current_or_guest_user.todos.new
  end

  def new
    @todo = current_or_guest_user.todos.new
  end

  def create
    @todo = current_or_guest_user.todos.create(todo_params)
    @todos = Todo.all
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {
        if @todo.save
         flash[:notice] = "New Task succesfully added."
         render 'success'
       else
         flash.now[:alert] = "Oops something went wrong. Please retry"
         render 'new'
       end
      }
    end
  end

  def edit
    @todo = Todo.find(params[:id])
    @todos = Todo.all
    respond_to do |format|
           format.js
       end
  end

  def update
    @todo = Todo.find(params[:id])
    @todos = Todo.all
    if @todo.incomplete?
      @todo.complete!
    else
      @todo.incomplete!
    end
    respond_to do |format|
      format.js {
         flash[:alert] = "Task Updated completed"
         render 'del_success'}
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    @todos = current_or_guest_user.todos.all
   respond_to do |format|
     format.js {
        flash[:alert] = "Task Succesfully completed"
        render 'del_success'}
   end
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :priority)
  end

  def authenticate_user!
    @user = current_or_guest_user
  end
end
