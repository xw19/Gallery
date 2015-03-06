require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @album = albums(:one)
  end

  test "it should be valid" do
    assert @album.valid?
  end

  test "name should be present" do
    @album.name = " "
    assert_not @album.valid?
  end

  test "name should not be too long" do
    @album.name = "a" * 21
    assert_not @album.valid?
  end

  test "about should not be too long" do
    @album.about = "a" * 101
    assert_not @album.valid?
  end
end
