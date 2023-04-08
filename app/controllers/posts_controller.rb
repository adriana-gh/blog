# frozen_string_literal: true
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: 'Title', body: 'Body goes here.')

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to @posts
  end
end