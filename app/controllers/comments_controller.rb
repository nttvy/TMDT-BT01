class CommentsController < ApplicationController
    before_action :find_blog

    def create
        @comment = @blog.comments.create!(comment_params)
        
        redirect_to blog_path(@blog.id)
    end


    def find_blog
        @blog = Blog.find(params[:blog_id])
    end

    private 
    def comment_params
        params.require(:comment).permit(:content)
    end
end
