class PostsController < ApplicationController
  def index
    @posts = Post.order("id desc")

    @announcements = Post.where(announcement: true).order("updated_at desc").limit(10)
    @best_posts = Post.where(best: true).order("updated_at desc").limit(10)
  end

  def show
    @post = Post.find params[:id]

    @announcements = Post.where(announcement: true).order("updated_at desc").limit(10)
    @best_posts = Post.where(best: true).order("updated_at desc").limit(10)
  end
end