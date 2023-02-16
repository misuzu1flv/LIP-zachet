# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :checkuser, except: :exit

  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.nil?

      redirect_to root_path, notice: 'Error check login or password.'
    else
      sign_in user
      current_user = user
      redirect_to tests_main_path
    end
  end

  def exit
    sign_out
    redirect_to :root
  end

  def sign_in(user)
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def sign_out
    session[:current_user_id] = nil
    self.current_user = nil
  end

  attr_writer :current_user

  private

  def checkuser
    redirect_to tests_main_path unless current_user.nil?
  end
end
