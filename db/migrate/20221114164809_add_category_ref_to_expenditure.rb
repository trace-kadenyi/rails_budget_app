class AddCategoryRefToExpenditure < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenditures, :category, null: false, foreign_key: true
  end
end
