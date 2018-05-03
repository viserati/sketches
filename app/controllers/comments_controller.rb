class CommentsController < ApplicationController

    before_action :authorize, :only => [:create]

    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      if @comment.save
      redirect_to article_path(@article), notice: "You successfully created a comment!"
    else
      redirect_to article_path(@article), alert: "Please Sign In or Sign Up to post a comment!"
      end
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment= @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end

    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
