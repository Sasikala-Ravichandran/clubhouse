require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  def setup
  	@member = Member.new(name: "Ex mem", password: "password",  password_confirmation: "password")
  end

  test "should be valid" do 
     assert @member.valid?
  end

  test "name should be present" do
 		@member.name = "  "
 		assert_not @member.valid?
  end
 test "name should not be short" do
    @member.name = "a"*1
    assert_not @member.valid?
 end

test "name should not be long" do
    @member.name = "a"*11
    assert_not @member.valid?
end

test "name should be unique" do
  d_mem = @member.dup
  @member.save

  assert_not d_mem.valid?
end

 test "password should be present" do
         @member.password =  " "
         assert_not @member.valid?
 end
 
  test "password should not be short" do
         @member.password = @member.password_confirmation = "a"*5
         assert_not @member.valid?
   end
 
end
