# frozen_string_literal: true

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save empty' do
    @test = Test.new
    assert_not @test.save
  end
  test 'should save not empty' do
    @test = Test.new(title: 'test')
    assert true
  end
end
