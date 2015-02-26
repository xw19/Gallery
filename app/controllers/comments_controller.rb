class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    @comments = @picture.comments.order("created_at DESC")
    respond_to do |format|
      format.html { redirect_to @picture }
      format.js
    end
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    comment = @picture.comments.find(params[:id])
    comment.destroy
    @comments = @picture.comments.order("created_at DESC")
    respond_to do |format|
      format.html { redirect_to @picture }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
