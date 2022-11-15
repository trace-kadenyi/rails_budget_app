class CategoryExpendituresController < ApplicationController
  before_action :set_expenditure_category, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @expenditures = @category.category_expenditures.includes(:expenditure).map(&:expenditure)
    @expenditures = @category.expenditure_categories.includes(:expenditure).map(&:expenditure)
  end
end
