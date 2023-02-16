# frozen_string_literal: true

class AddDataToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :data, :string
  end
end
