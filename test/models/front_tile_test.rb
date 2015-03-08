require 'test_helper'

class FrontTileTest < ActiveSupport::TestCase
  setup do
    @tile = front_tiles(:one)
  end

  test "it should be valid" do
    assert @tile.valid?
  end

  test "title should be present" do
    @tile.title = " "
    assert_not @tile.valid?
  end

  test "title should not be too long" do
    @tile.title = "a" * 51
    assert_not @tile.valid?
  end

  test "link should be present" do
    @tile.link_url = " "
    assert_not @tile.valid?
  end

  test "link should not be too long" do
    @tile.link_url = "a" * 101
    assert_not @tile.valid?
  end

  test "image should be present" do
    @tile.image_url = " "
    assert_not @tile.valid?
  end

  test "image should not be too long" do
    @tile.image_url = "a" * 101
    assert_not @tile.valid?
  end

end
