require 'rqrcode_png'
class TodosController < ApplicationController
    helper_method :current_or_guest_user
    def index
        @todos = guest_user.todos.all
        @todo = guest_user.todos.new
        @qr = RQRCode::QRCode.new("#{sessions_login_path}"+"?id=#{guest_user.id}").to_img.resize(100,100).to_data_url
    end

    def new
        @todo = guest_user.todos.new
    end

    def create
        @todo = guest_user.todos.create(todo_params)
        @todos = guest_user.todos.all
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js do
                if @todo.save
                    flash[:notice] = 'New Task succesfully added.'
                    render 'success'
                else
                    flash.now[:alert] = 'Oops something went wrong. Please retry'
                    render 'new'
               end
            end
        end
    end

    def edit
        @todo = Todo.find(params[:id])
        @todos = guest_user.todos.all
        respond_to do |format|
            format.js
        end
    end

    def update
        @todo = Todo.find(params[:id])
        @todos = guest_user.todos.all
        if @todo.incomplete?
            @todo.complete!
        else
            @todo.incomplete!
        end
        respond_to do |format|
            format.js do
                flash[:alert] = 'Task Updated completed'
                render 'del_success'
            end
        end
    end

    def destroy
        @todo = guest_user.todos.find(params[:id])
        @todo.destroy
        @todos = guest_user.todos.all
        respond_to do |format|
            format.js do
                flash[:alert] = 'Task Succesfully completed'
                render 'del_success'
            end
        end
    end

    private

    def todo_params
        params.require(:todo).permit(:description, :priority)
    end
end
