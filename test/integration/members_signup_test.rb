require 'test_helper'

class MembersSignupTest < ActionDispatch::IntegrationTest
  
 test "invalid signup information" do 
   get new_member_path
   assert_no_difference 'Member.count' do
      post members_path, member: { name: "",
      							   password: "members",
      							   password_confirmation: "members" }
   end	
   assert_template 'members/new'
 end

test "valid signup information" do
  get new_member_path
  assert_difference 'Member.count', 1 do
    post_via_redirect members_path, member: { name: "m6",
      							   password: "members",
      							   password_confirmation: "members" }
  end
  assert_template 'members/show'
end
end

 