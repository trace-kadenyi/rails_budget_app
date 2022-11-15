class CategoryExpenditure < ApplicationRecord
  belongs_to :category
  belongs_to :expenditure

    def increment_total
    category.update(total: category.total + expense.amount)
  end

  def decrement_total
    category.update(total: category.total - expense.amount)
  end
end
