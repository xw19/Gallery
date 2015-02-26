module ApplicationHelper
  def is_admin?
    true if user_signed_in? && current_user.admin
  end


  def own_user?
    @picture = Picture.find(params[:id])
    unless @picture.user == current_user
      flash[:danger] = "You dont have permission to edit/destroy"
      redirect_to @picture
    end
  end
end
