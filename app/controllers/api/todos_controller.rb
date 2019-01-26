module Api

	class TodosController < ApplicationController
		skip_before_action :verify_authenticity_token

		def index
			todos = Todo.all
			render json: {:message => "todos list", :status => "SUCCESS", :data => todos}, status: :ok			
		end

		def show

			begin
			  todo = Todo.find params[:id]
			rescue ActiveRecord::RecordNotFound => e
			  todo = nil
			end

			render json: {:message => "todo data", :status => "SUCCESS", :data => todo}, status: :ok			
		end


		def create
			todo = Todo.new(todo_params)

			if todo.save
				render json: {:message => "todo saved sucessfully", :status => "SUCCESS", :data => todo}, status: :ok
			else
				render json: {:message => "unable to save", :status => "ERROR", :data => todo}, status: :ok
			end
			
		end

		private 

		def todo_params
			params.permit(:name,:description)
		end

	end


end