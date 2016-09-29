class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.order("created_at DESC").page(params[:page]).per_page(5)
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new

    @blog.record_timestamps = false
    @blog.update_attributes(:nb_view => @blog.nb_view.to_i + 1)
    @blog.record_timestamps = true
  end

  def create
    @blog = Blog.create!(blog_params)

    flash[:success] = "Blog successfully created!"
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

    flash[:success] = "Blog successfully deleted!"
    redirect_to blogs_url
  end

  def search
    @keywords = params.require(:keywords)
    @blogs = Blog.where("title like ?", "%#{@keywords}%").page(params[:page]).per_page(5)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
