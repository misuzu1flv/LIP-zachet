# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title

      t.timestamps
    end
  end
end
