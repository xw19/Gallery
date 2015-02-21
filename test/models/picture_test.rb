require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  def setup
    @picture = pictures(:one)
  end

  test "name should be present" do
    @picture.name = " "
    assert_not @picture.valid?
  end

  test "name should not be too long" do
    @picture.name = "a" * 21
    assert_not @picture.valid?
  end


  test "description should not be too long" do
    @picture.description = "a" * 71
    assert_not @picture.valid?
  end
end
