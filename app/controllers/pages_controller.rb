class PagesController < ApplicationController
  def index
  	@users = User.all
  	@posts = Post.all
    @like = []
    @posts.each do |post|
      @likes = Like.where(post_id: post.id).sum(:like)
      @like[post.id] = @likes
    end
  end

  def about
  end
  
  def user
  	@users = User.where(user_id: current_user)
  	@posts = Post.all
  end

  def newp
    @users = User.all
    @posts = Post.order('created_at DESC')
    @like = []
    @posts.each do |post|
      @likes = Like.where(post_id: post.id).sum(:like)
      @like[post.id] = @likes
    end
  end

  def visitp
    @users = User.all
    @posts = Post.order(visit: :desc)
    @like = []
    @posts.each do |post|
      @likes = Like.where(post_id: post.id).sum(:like)
      @like[post.id] = @likes
    end
  end

end
