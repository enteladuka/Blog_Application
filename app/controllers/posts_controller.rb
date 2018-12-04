class PostsController < ApplicationController
  before_action :post_owner, only: [:destroy, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #render plain: params[:post].inspect
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
      flash[:notice] = "Post successfully updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def post_owner
      unless current_user.id == @post.user_id
        flash[:error] = "Restricted Access!"
        redirect_to @post
      end
    end
end
