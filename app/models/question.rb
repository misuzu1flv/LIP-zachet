# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :results, dependent: :delete_all
end
