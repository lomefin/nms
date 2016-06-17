class PostsController < ApplicationController

  def index
    @posts = Post.of_channel(params[:channel]).published.incremental
  end

  def show
    @post = Post.of_channel(params[:channel]).published.find_by_uuid params[:uuid]
  end

end
