# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save empty' do
    @user = User.new
    assert_not @user.save
  end
  test 'should save not empty' do
    @user = User.new(email: 'test')
    assert @user.save
  end
end
