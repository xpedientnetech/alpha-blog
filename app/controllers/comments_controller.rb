class CommentsController < ApplicationController
  before_action :set_article
  
  def index
     @comments = Comment.paginate(page: params[:page], per_page: 10)     
  end
   
  def new
    @comment = Comment.new
  end
   
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = Article.find(params[:article_id]).id
    @comment.user_id = current_user.id #or whatever is you session name
    if @comment.save
      flash[:success] = "Comment was created successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
    
  def edit
    @comment = Comment.find(params[:id])
  end
    
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "comment name was successfully updated"
      redirect_to comment_path(@comment)
    else
      render 'edit'
    end
  end
   
  def show
    @comment = Comment.find(params[:id])
    @article_comments = @comment.articles.paginate(page: params[:page], per_page: 10)
  end
 
  private
    def comment_params
        params.require(:comment).permit(:username, :comment, :article_id, :user_id)
    end
    
    def set_article
      @article = Article.find(params[:article_id])
    end
    
end