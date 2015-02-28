class ReportsController < ApplicationController
  before_action :authenticate_user!
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save
    redirect_to root_path, alert: "Reported"
  end

  private

  def report_params
    params.require(:report).permit(:reason, :reportable_type, :reportable_id)
  end
end
