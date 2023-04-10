class PostsController < ApplicationController
  before_action :find_post
  def index
    @posts = Post.all
    render json: @posts, status: 200
  end

  def show
    render json: @post, status: 200
  end

  def edit
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
    )
    if @post.save
      render json: @post, status: 200
    else
      render json: @post.errors, status: 400
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(title: params[:title], content: params[:content]) 
      render json: @post, status: 200
    else
      render json: @post.errors, status: 400
    end
  end

  def destroy
    @post = @post.destroy
    render json: {
      error: "Post Deleted Successfully "
      }, status: 200
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
