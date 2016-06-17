class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  def index
    @posts = Post.incremental
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    show_post
  end

  def edit
  end

  def update
    @post = Post.update post_params
    show_post
  end

  def destroy
    @post.destroy
  end

  def publish
    @post.publish!
    show_post
  end

  def unpublish
    @post.unpublish!
    show_post
  end

  private

  def show_post
    redirect_to admin_post_path uuid: @post.uuid and return
  end

  def post_params
    params.require(:post).permit(:title, :message, :channel, :url)
  end

  def set_post
    @post = Post.find_by_uuid params[:uuid]
  end
end
