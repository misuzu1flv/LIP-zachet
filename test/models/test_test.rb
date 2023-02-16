# frozen_string_literal: true

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test 'should not save empty' do
    @test = Test.new
    assert_not @test.save
  end
  test 'should save not empty' do
    @test = Test.new(title: 'test')
    assert @test.save
  end
end
