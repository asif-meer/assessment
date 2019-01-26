module Api

	class TodosController < ApplicationController

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
			# todo = Todo.find(params[:id])
			render json: {:message => "todo data", :status => "SUCCESS", :data => todo}, status: :ok			
		end

	end


end