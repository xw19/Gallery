class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:destroy]

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    @comments = @picture.comments.order("created_at DESC").limit(10)
    respond_to do |format|
      format.html { redirect_to @picture }
      format.js
    end
  end

  def destroy
    @comment.destroy
    @comments = @picture.comments.order("created_at DESC").limit(10)
    respond_to do |format|
      format.html { redirect_to @picture }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def check_user
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.find(params[:id])
    unless @comment.user === current_user || @picture.user === current_user
      redirect_to @picture, alert: "You are not allowed"
    end
  end
end
