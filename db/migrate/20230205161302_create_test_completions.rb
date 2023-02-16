# frozen_string_literal: true

class CreateTestCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :test_completions do |t|
      t.integer :score

      t.timestamps
    end
    add_reference :test_completions, :user, foreign_key: true
    add_reference :test_completions, :test, foreign_key: true
  end
end
