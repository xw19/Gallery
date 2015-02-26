require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = comments(:one)
  end

  test "it should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
     @comment.body = " "
     assert_not @comment.valid?
   end

   test "body should not be too long" do
     @comment.body = "a" * 101
     assert_not @comment.valid?
   end

end
