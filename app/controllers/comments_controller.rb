class CommentsController < ApplicationController
    
    #  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
    #  before_action :authenticate_user!
        # user_signed_in?

        # user_member

        # user_session


     load_and_authorize_resource

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
         authorize! :manage, @comment
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
      params.require(:comment).permit(:commenter, :body)
    end
end
