class Admin::PostsController < AdminController
  def index
    @posts = Post.order("id desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update_attributes post_params
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit!
  end
end