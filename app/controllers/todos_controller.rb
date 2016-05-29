class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(todo_params)
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
    @todos = Todo.all
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
end
