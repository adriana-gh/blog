# frozen_string_literal: true
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)

    if @comment.save
      redirect_to @post
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.status = 'archived'

    if comment.save
      redirect_to post
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def comments_params
    params.require(:comment).permit(:author, :body)
  end
end