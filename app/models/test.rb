# frozen_string_literal: true

class Test < ApplicationRecord
  validates :title, presence: true
  has_many :questions, dependent: :delete_all
  has_many :test_completions, dependent: :delete_all
end
