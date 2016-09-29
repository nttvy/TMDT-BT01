class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order("created_at DESC")
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end

  def create
    @blog = Blog.create!(blog_params)

    redirect_to blogs_url
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)

    redirect_to blog_path(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.comments.each do |comment|
      comment.destroy
    end
    @blog.destroy
    redirect_to blogs_url
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
