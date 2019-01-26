module Api

	class TodosController < ApplicationController

		def index
			todos = Todo.all
			render json: {:message => "todos list", :status => "SUCCESS", :data => todos}, status: :ok			
		end

	end


end