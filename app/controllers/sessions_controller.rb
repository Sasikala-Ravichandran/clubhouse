class SessionsController < ApplicationController
  def new

  end

  def create
  	member = Member.find_by(name: params[:session][:name])
  	if member && member.authenticate(params[:session][:password])
   		login(member)
   		if params[:session][:remember_me] == '1'
   			remember(member)
   		end
  		redirect_to posts_path
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	logout if logged_in?
  	flash.now[:notice] = "Successfully logged out"
  	redirect_to clubhouse_path
  end
end
