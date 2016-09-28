class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.create!(blog_params)

    redirect_to blogs_url
  end

  private
  def blog_params
  params.require(:blog).permit(:title, :content)
  end
end
