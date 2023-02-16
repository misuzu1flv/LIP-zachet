# frozen_string_literal: true

class AddResultValueToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :result_value, :string
  end
end
