class CommentsController < ApplicationController

  
  def index
     @comments = Comment.paginate(page: params[:page], per_page: 10)     
  end
   
  def new
    @comment = Comment.new
  end
   
  def create
    @comment.article_id = params[:article_id]
    @comment.article = Article.find(params[:article_id])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Comment was created successfully"
      redirect_to comments_path
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
        params.require(:comment).permit(:username, :comment_desc, comment_ids: [])
    end
    
end