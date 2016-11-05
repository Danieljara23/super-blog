class PostsController < ApplicationController

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

  def edit
  end

  def index
  end

  def show
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end
end
