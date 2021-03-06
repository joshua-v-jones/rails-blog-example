class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  def update
	@article = Article.find(params[:article_id])
	@comment = @article.comments.find(params[:id])
	@comment.update(comment_status_params)
    redirect_to article_path(@article)
  end
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end
  	def destroy
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
	    redirect_to article_path(@article)
  	end
  private
	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
	end
	def comment_status_params
		params.permit(:status)
	end
end
