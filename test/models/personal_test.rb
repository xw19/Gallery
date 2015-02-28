require 'test_helper'

class PersonalTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@testmail.com", password: "confirmed", password_confirmation: "confirmed")
    @personal = @user.build_personal(first_name: "Sourav", last_name: "moitra", date_of_birth: '05/04/1992', gender: "M", about_me: "I am a random person", avatar: "avatar")
  end

  test "it should be valid" do
    assert @personal.valid?
  end

  test "first name should be present" do
    @personal.first_name = " "
    assert_not @personal.valid?
  end

  test "first name should not be too long" do
    @personal.first_name = "a" * 21
    assert_not @personal.valid?
  end

  test "last name should be present" do
    @personal.first_name = " "
    assert_not @personal.valid?
  end

  test "last name should not be too long" do
    @personal.last_name = "a" * 21
    assert_not @personal.valid?
  end

  test "date of birth should be present" do
    @personal.date_of_birth = " "
    assert_not @personal.valid?
  end

  test "gender should be present" do
    @personal.gender = " "
    assert_not @personal.valid?
  end


  test "gender should reject bad values" do
    bad_values = %w(Male female random)
    bad_values.each do |bv|
      @personal.gender = bv
      assert_not @personal.valid?
    end
  end

  test "gender should accept values" do
    values = %w(M F)
    values.each do |v|
      @personal.gender = v
      assert @personal.valid?
    end
  end
end
