# frozen_string_literal: true

require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  test 'should get main' do
    User.new(email: '123', username: '123', password: 123).save
    post '/sessions/create', params: { email: '123', password: 123 }
    get tests_main_path
    assert_response :success
  end

  test 'should get new' do
    User.new(email: '123', username: '123', password: 123).save
    post '/sessions/create', params: { email: '123', password: 123 }
    get tests_new_path
    assert_response :success
  end

  test 'should show test' do
    User.new(email: '123', username: '123', password: 123).save
    post '/sessions/create', params: { email: '123', password: 123 }

    @test = Test.new(user_id: 1, title: 'hi')
    @test.save
    get test_path(@test)
    assert_response :success
  end

  test 'should create test' do
    User.new(email: '123', username: '123', password: 123).save
    post '/sessions/create', params: { email: '123', password: 123 }
    assert_difference('Test.count') do
      get tests_submit_test_path, params: { title: 'hi', questions: ['hi'], answers: ['s'] }
    end

    assert_response :ok
  end
end
