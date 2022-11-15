class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit create update destroy]

  def index
    @expenditures = Expenditure.all
  end

  def show
    @category = Category.find(params[:category_id])
    @expenditure = @category.expenditures.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @expenditure = Expenditure.new
  end

  def edit; end

  # post/expenditures
  def create
    @category = Category.find(params[:category_id])
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.user_id = current_user.id
    @expenditure = CategoryExpenditure.create!(category: @category, expenditure: @expenditure)

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to category_url(@category), notice: 'Transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_expenditure }
      end
    end
  end

  def update
    if @expenditure.update(expenditure_params)
      redirect_to @expenditure
    else
      render :edit, status: :unprocessable_expenditure
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @expenditure = set_expenditure
    @expenditure.destroy
    redirect_to category_path(params[:category_id])
  end

  private

  def set_expenditure
    @expenditure = Expenditure.find(params[:id])
  end

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount)
  end

end
