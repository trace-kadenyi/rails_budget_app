class CategoryExpendituresController < ApplicationController
  before_action :set_category_expenditure, only: %i[show edit update destroy]

  # GET /category_records or /category_records.json
  def index
    @category_expenditures = CategoryExpenditure.all
  end

  # GET /category_records/1 or /category_records/1.json
  def show; end

  # GET /category_records/new
  def new
    @category_expenditure = CategoryExpenditure.new
  end

  # GET /category_records/1/edit
  def edit; end

  # POST /category_records or /category_records.json
  def create
    @category_expenditure = CategoryExpenditure.new(category_expenditure_params)

    respond_to do |format|
      if @category_expenditure.save
        format.html do
          redirect_to category_expenditure_url(@category_expenditure), notice: 'Category expenditure was successfully created.'
        end
        format.json { render :show, status: :created, location: @category_expenditure }
      else
        format.html { render :new, status: :unprocessable_expenditure }
        format.json { render json: @category_expenditure.errors, status: :unprocessable_expenditure }
      end
    end
  end

  # PATCH/PUT /category_records/1 or /category_records/1.json
  def update
    respond_to do |format|
      if @category_expenditure.update(category_expenditure_params)
        format.html do
          redirect_to category_expenditure_url(@category_expenditure), notice: 'Category record was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category_expenditure }
      else
        format.html { render :edit, status: :unprocessable_expenditure }
        format.json { render json: @category_expenditure.errors, status: :unprocessable_expenditure }
      end
    end
  end

  # DELETE /category_records/1 or /category_records/1.json
  def destroy
    @category_expenditure = set_category_expenditure
    @category_expenditure.destroy
    # redirect_to category_expenditures_url

    respond_to do |format|
      format.html { redirect_to category_expenditures_url, notice: 'Category record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category_expenditure
    @category_expenditure = CategoryExpenditure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_expenditure_params
    params.require(:category_expenditure).permit(:category_id, :expenditure_id)
  end

  private :set_category_expenditure, :category_expenditure_params
end
