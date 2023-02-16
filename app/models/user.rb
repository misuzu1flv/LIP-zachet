# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true
  has_many :results, dependent: :delete_all
  has_many :test_completions, dependent: :delete_all
  has_many :tests, dependent: :delete_all
  def has_password?(submitted_password)
    password == submitted_password
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
end
