require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = categories(:nature)
  end

  test "it should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 21
    assert_not @category.valid?
  end

  test "description should be present" do
    @category.description = " "
    assert_not @category.valid?
  end

  test "description should not be too long" do
    @category.description = "a" * 51
    assert_not @category.valid?
  end

  test "purity should not include invalid keywords" do
    invalid_purity = %w(random good bad sexy 124)
    invalid_purity.each do |invalid|
      @category.purity = invalid
      assert_not @category.valid?
    end
  end

  test "purity should include valid keywords" do
    valid_purity = %w(safe sketchy nsfw)
    valid_purity.each do |valid|
      @category.purity = valid
      assert @category.valid?
    end
  end
end
