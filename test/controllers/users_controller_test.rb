# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should open registration on not logged in user' do
    get users_new_path
    assert_response :success
  end

  test 'can open other profile' do
    User.new(email: '123', username: '123', password: 123).save
    User.new(email: '2', username: '2', password: 123).save
    post '/sessions/create', params: { email: '123', password: 123 }
    get users_path(User.last)
    assert true
  end

  test 'can open profile' do
    @user = User.new(email: '123', username: '123', password: 123)
    @user.save
    post '/sessions/create', params: { email: '123', password: 123 }
    get users_path(@user)
    assert true
  end
end
