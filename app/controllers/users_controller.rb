# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    redirect_back(fallback_location: root_path) unless current_user.admin
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @tests = Test.all
  end

  # GET /users/new
  def new
    redirect_back(fallback_location: root_path) if !current_user.nil? && !current_user.admin
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_back(fallback_location: root_path) unless current_user.admin || (current_user.id == @user.id)
  end

  # POST /users or /users.json
  def create
    redirect_back(fallback_location: root_path) if !current_user.nil? && !current_user.admin
    @user = User.new(user_params)
    @user.save!
    redirect_to tests_main_path, notice: 'User was successfully created.'
  rescue ActiveRecord::RecordNotUnique
    redirect_to users_new_path, notice: 'Email or username have already been taken'
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    redirect_back(fallback_location: root_path) unless current_user.admin || (current_user.id == @user.id)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    redirect_back(fallback_location: root_path) unless current_user.admin || (current_user.id == @user.id)
    @user.results.clear
    @user.test_completions.clear
    @user.tests.clear
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username, :email, :password).merge!(admin: false)
  end
end
