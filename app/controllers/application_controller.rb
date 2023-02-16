# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale
  before_action :authenticate, except: %i[new create]

  def current_user
    @_current_user ||= session[:current_user_id] &&
                       User.find_by_id(session[:current_user_id])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def authenticate
    return if current_user

    redirect_to root_path
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = if I18n.available_locales.include?(locale)
                    locale
                  else
                    I18n.default_locale
                  end
    p locale
  end
end
