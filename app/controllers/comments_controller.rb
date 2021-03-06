class CommentsController < ApplicationController
before_action :find_post
before_action :find_comment, only: [:edit, :update, :destroy, :comment_owner]
before_action :comment_owner, only: [:destroy, :edit, :update]

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to post_path(@post)
    else
      render 'new'
    end

  end
  def edit
  end
  def update
    if @comment.update(comment_params)
      flash[:success] = "Comment successfully updated!"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:username,:body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:error] = "Restricted Access!"
      redirect_to @post
    end
  end

end
