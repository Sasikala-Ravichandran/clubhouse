class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(posts_params)
  	@post.member_id = current_member.id
  	if @post.save
  		redirect_to @post.member
  	else
  		render 'new'
  	end
  end

  def index
  	@posts = Post.all
  end

  private
  def posts_params
  	params.require(:post).permit(:name, :text)
  end
end
