class ArticleCommentController < ApplicationController
  
  def index
    @article_comment = ArticleComment.all
  end
  
  def new
    @article_comment = ArticleComment.new
  end
  
  def create
    if (params[:comment_id] && params[:article_id]).present?
      @article_comment = ArticleComment.new(article_id: params[:article_id], comment_id: params[:comment_id])
      ArticleComment.save
    else
      @article_comment = nil
      flash[:error] = "Comment was not created"
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_stock
      @article_comments = ArticleComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_stock_params
      params.require(:article_comment).permit(:article_id, :comment_id)
    end
end