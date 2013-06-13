class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(params[:comment])
    @link = @comment.link

    if @comment.save
      redirect_to link_url(@link)
    else
      render json: "Your comment did not save. Go back and try again."
    end
  end
end
