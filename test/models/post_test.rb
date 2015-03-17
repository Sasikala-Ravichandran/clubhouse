require 'test_helper'

class PostTest < ActiveSupport::TestCase
   
   def setup
      @post = Post.new(name: "post1", text: "text1")
   end

   test "name should be present" do 
   	  @post.name=" "
   	  assert_not @post.valid?
   end

   test "text should be present" do
      @post.text=" "
      assert_not @post.valid?
   end

end
