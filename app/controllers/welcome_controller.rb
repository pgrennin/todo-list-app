class WelcomeController < ApplicationController
	def login
		# user ||= User.new
		user = User.new

		# create and login a demo user
		@rand = (0...8).map { (65 + rand(26)).chr }.join
		@rand2 = (0...8).map { (65 + rand(26)).chr }.join
		user.email = @rand + "@demouser.com"
		user.password = @rand2
		user.password_confirmation = @rand2
		user.save!
		sign_in(:user, user) 
		@todos = current_user.todos.order(position: :asc)
		# raise user_signed_in?.inspect
		# raise 'here'
	end
end
