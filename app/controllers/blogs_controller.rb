class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = Comment.where(blog_id: @blog).order("created_at DESC")
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

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
