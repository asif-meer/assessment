module Api

	class TodosController < ApplicationController
		# respond_to :json

		skip_before_action :verify_authenticity_token

		swagger_controller :todos, 'Todos'

      swagger_api :index do
        summary 'Returns all tods'
        notes 'Notes...'
      end

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
				render json: {:message => "unable to save", :status => "ERROR", :data => todo}, status: :unprocessable_entity
			end
			
		end

		def update

			begin
			  todo = Todo.find params[:id]
			rescue ActiveRecord::RecordNotFound => e
			  todo = nil
			end

			if todo.nil?
				render json: {:message => "invalid todo id", :status => "ERROR", :data => todo}, status: :unprocessable_entity
			else
				if todo.update_attributes(todo_params)
					render json: {:message => "todo updated sucessfully", :status => "SUCCESS", :data => todo}, status: :ok
				else
					render json: {:message => "unable to update", :status => "ERROR", :data => todo}, status: :unprocessable_entity
				end				
			end

			
		end

		def destroy
			begin
			  todo = Todo.find params[:id]
			rescue ActiveRecord::RecordNotFound => e
			  todo = nil
			end

			if todo.nil?
				render json: {:message => "invalid todo id", :status => "ERROR", :data => todo}, status: :unprocessable_entity
			else
				if todo.destroy
					render json: {:message => "todo deleted sucessfully", :status => "SUCCESS", :data => todo}, status: :ok
				else
					render json: {:message => "unable to delete", :status => "ERROR", :data => todo}, status: :unprocessable_entity
				end				
			end		
		end

		private 

		def todo_params
			params.permit(:name,:description)
		end

	end


end