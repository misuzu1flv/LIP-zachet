# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results, &:timestamps
    add_reference :results, :user, foreign_key: true
    add_reference :results, :question, foreign_key: true
  end
end
