class CategoryExpendituresController < ApplicationController
  before_action :set_expenditure_category, only: %i[show edit update destroy]

  before_action :authenticate_user!
  
  def index
    @category = Category.find(params[:category_id])
    @expenditures = @category.category_expenditures.includes(:expenditure).map(&:expenditure)
    @expenditures = @category.category_expenditures.includes(:expenditure).map(&:expenditure)
  end
end
