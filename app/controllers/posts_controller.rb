class PostsController < ApplicationController
 before_action :authenticate_user!, except:[:show, :index]
  before_action :set_post, only: [:show,:edit,:update,:destroy]
  def new
  @post = Post.new
  end 

  def show
   @like = {}
   @likes = Like.sum(:like)
    @like = @likes
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save

  		redirect_to root_path, :notice => "Post successfully created"
  	else
  		render 'new'
  	end

  end
  
  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  def edit
  end

  def update
  	@post.update(post_params)
  	redirect_to root_path
  end

  def like
    @post = Post.find(params[:id])
    @like = Like.where(user_id: current_user.id, post_id: @post.id).first
    if @like == nil
        @like = 1
        Like.create(user_id: current_user.id, post_id: @post.id, like: @like)
    else
      if @like.like == 0
        @like.update(like: @like.like+1)
      else
        @like.update(like: @like.like-1)
      end
    end
    redirect_to post_path(@post.id)
  end

  private
  	def post_params
  		params.require(:post).permit(:user_id,:title,:body)
	
  	end

  	def set_post
  		@post = Post.find(params[:id])
  	end
end