module SessionsHelper

def login(member)
  session[:member_id] = member.id
end

def remember(member)
	member.remember
	cookies.permanent[:remember_token] = member.remember_token
	cookies.permanent.signed[:member_id] = member.id
end
def current_member
	if(member_id = session[:member_id])
  @current_member ||= Member.find_by(id: member_id)
   elsif (member_id = cookies.signed[:member_id])
   	member = Member.find_by(id: member_id)
   	if member && member.authenticated?(cookies[:remember_token])
   		login(member)
   		@current_member = member
   	end
   end
end

def logged_in?
   !current_member.nil?
end

def forget(member)
	member.forget
	cookies.delete(:remember_token)
	cookies.delete(:member_id)
end
def logout
	forget(current_member)
  session.delete(:member_id)
  @current_member = nil
end
end
