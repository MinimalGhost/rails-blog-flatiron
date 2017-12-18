class CommentsController < ApplicationController
  def create
    # get the article to which the comment is attached
    @article = Article.find(params[:article_id])
    # link the comment so that it belongs to that particular article
    @comment = @article.comments.create(comment_params)
    # send the user back to the original article
    redirect_to article_path(@article)
  end

  def destroy
    # find the article we are looking at
    @article = Article.find(params[:article_id])
    # locate the comment within the @article.comments collection
    @comment = @article.comments.find(params[:id])
    # remove it from the database and send us back
    # to the show action for the article
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
