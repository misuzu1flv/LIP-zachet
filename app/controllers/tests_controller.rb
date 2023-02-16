# frozen_string_literal: true

class TestsController < ApplicationController
  protect_from_forgery except: :submit_test
  before_action :set_test, only: %i[show edit update destroy]

  # instead of index
  def main
    @tests = Test.all
  end

  # new test view controller
  def new; end

  # test submition
  def submit_test
    @test = Test.new(user_id: current_user.id, title: params[:title], data: params[:desc])
    return unless @test.save

    pquestions = params[:questions]
    panswers = params[:answers]
    pquestions.each_with_index do |x, i|
      Question.new(question: x, answer: panswers[i], test_id: @test.id).save
    end
    render js: "window.location = '/?locale=#{params[:locale].to_s.strip.to_sym}'"
  end

  # test testing
  def answers
    @test = Test.find(params[:test_id])
  end

  # test overview
  def show; end

  # doesn't exist
  def edit; end

  # submit test completion
  def submit_results
    @test = Test.find(params[:test_id])
    if TestCompletion.find_by(user_id: current_user.id, test_id: @test.id).nil?
      score = 0
      t = 0
      params[:values].each_with_index do |x, i|
        Result.new(user_id: current_user.id, question_id: @test.questions[i].id, result_value: x).save
        score += 1 if x == @test.questions[i].answer
        t += 1
      end
      score *= 100
      TestCompletion.new(user_id: current_user.id, test_id: @test.id, score: score / t).save
    end
    render js: "window.location = 'results?locale=#{params[:locale].to_s.strip.to_sym}'"
  end

  def results
    @test = Test.find(params[:test_id])
    @test_author = User.find_by(id: @test.user_id)
  end

  def all_results
    @test = Test.find(params[:test_id])
  end

  # test destruction
  def destroy
    redirect_back(fallback_location: root_path) unless current_user.admin || (current_user.id == @test_author.id)
    @test.questions.clear
    @test.test_completions.clear
    @test.destroy
    redirect_to tests_main_path, notice: 'Test succesfully deleted'
  end

  private

  def set_test
    @test = Test.find(params[:id])
    @test_author = User.find_by(id: @test.user_id)
  end
end
