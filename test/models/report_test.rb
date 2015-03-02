require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = reports(:one)
  end

  test "it should be valid" do
    assert @report.valid?
  end

  test "it reason should be present" do
    @report.reason = " "
    assert_not @report.valid?
  end

  test "it reason should not be too long" do
    @report.reason = "a" * 51
    assert_not @report.valid?
  end
end
