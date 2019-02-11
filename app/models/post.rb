# https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
class Post < ApplicationRecord
	validates_presence_of :name
end
