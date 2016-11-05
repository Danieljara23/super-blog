class PostsController < ApplicationController
  before_action :find_post, only: [:edit,:show,:update,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'The post have been saved'
      redirect_to post_path(id: @post.id, it_was: 'created')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Store was successfully updated'
      redirect_to post_path(id: @post.id, it_was: 'updated')
    else
      render edit
    end
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  def show

  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post was successfully deleted.'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
