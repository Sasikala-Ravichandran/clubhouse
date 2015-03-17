class MembersController < ApplicationController

   before_action :set_member, only: [:show, :edit, :update, :destroy]
   before_action :logged_in_member, only: [:show, :edit, :update]
def index
	@members = Member.all
end

def show
end

def new
	@member = Member.new
end

def create
	@member = Member.new(member_params)
	if @member.save
	   flash[:notice] = "sucessfully created"
	   redirect_to @member
	else
		flash[:error] = "not created"
	 	render "new"
	end
end

def edit
end

def update
	if @member.update(member_params)
	   flash[:notice] = "sucessfully updated"
	   redirect_to @member
	else
		flash[:notice] = "not updated"
	 	render "new"
	end

end

def destroy
	@member.destroy
end

 
private 
def logged_in_member
   unless logged_in?
   	flash[:danger] = "Please log in"
   	redirect_to login_path
   end
end
def set_member
   @member = Member.find(params[:id])
end

def member_params
	params.require(:member).permit(:name, :password, :password_confirmation)
end

end
