class PostsController < ApplicationController
  before_action :find_post, only: [ :update, :show, :destroy]
  before_action :doorkeeper_authorize!

  def index
    @posts = current_user.posts.all
    render json: @posts, status: 200
  end

  def show
    render json: @post, status: 200
  end

  def edit
  end

  def new
    @posts = current_user.post.new
  end

  def create
    
    @post = current_user.posts.new(
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
    @post = current_user.post.find_by(id: params[:id])
  end
end
