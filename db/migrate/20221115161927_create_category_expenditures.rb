class CreateCategoryExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :category_expenditures do |t|
      t.references :category, null: false, foreign_key: true
      t.references :expenditure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
