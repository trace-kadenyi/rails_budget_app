class ExpendituresController < ApplicationController
  def index
    @expenditures = Expenditure.all
  end

  def show
    @expenditure = Expenditure.find(params[:id])
  end

  def new
    @expenditure = Expenditure.new
  end

  def edit; end

  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.user_id = current_user.id

    respond_to do |format|
      if @expenditure.save
        @category = CategoryExpenditure.create(expenditure_id: @expenditure.id,
                                               category_id: expenditure_category_params[:category_id])

        format.html do
          redirect_to category_category_expenditures_path(@category.category_id),
                      notice: 'Expenditure was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html do
          redirect_to category_path(@expenditure.category_id), notice: 'Expenditure was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expenditure = Expenditure.find(params[:id])
    # @expenditure.category_expenditures.first.decrement_total
    @expenditure.destroy

    respond_to do |format|
      format.html do
        redirect_to category_category_expenditures_path(@expenditure), notice: 'Expenditure was successfully destroyed.'
      end
    end
  end

  private

  def set_expenditure
    @expenditure = Expenditure.find(params[:id])
  end

  def expenditure_params
    params.require(:expenditure).permit(:name, :amount)
  end

  def expenditure_category_params
    params.require(:expenditure).permit(:category_id)
  end
end
