class PostsController < ApplicationController

  def index
    @posts = Post.of_channel(params[:channel]).published.incremental
  end
end
