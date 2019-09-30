class LifeItemsController < ApplicationController
  before_action :set_life_item, only: [:show, :edit, :update, :destroy]

  # GET /life_items
  # GET /life_items.json
  def index
    @life_items = LifeItem.all

    date_from = Date.parse('1990-01-30')
    date_to = date_from + 100.years
    date_range = date_from..date_to

    hash = Hash[date_range.group_by(&:year).map do |y, items|
      [y, items.group_by { |d| d.month }.map { |month| "" }]
    end]
    @life_cycle = @life_items.each_with_object(hash) do |items, h|
      h[items.date.beginning_of_year.year][items.date.beginning_of_month.month] = items.title
    end
  end

  # GET /life_items/1
  # GET /life_items/1.json
  def show
  end

  # GET /life_items/new
  def new
    @life_item = LifeItem.new
  end

  # GET /life_items/1/edit
  def edit
  end

  # POST /life_items
  # POST /life_items.json
  def create
    @life_item = LifeItem.new(life_item_params)

    respond_to do |format|
      if @life_item.save
        format.html { redirect_to @life_item, notice: 'Life item was successfully created.' }
        format.json { render :show, status: :created, location: @life_item }
      else
        format.html { render :new }
        format.json { render json: @life_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /life_items/1
  # PATCH/PUT /life_items/1.json
  def update
    respond_to do |format|
      if @life_item.update(life_item_params)
        format.html { redirect_to @life_item, notice: 'Life item was successfully updated.' }
        format.json { render :show, status: :ok, location: @life_item }
      else
        format.html { render :edit }
        format.json { render json: @life_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_items/1
  # DELETE /life_items/1.json
  def destroy
    @life_item.destroy
    respond_to do |format|
      format.html { redirect_to life_items_url, notice: 'Life item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_life_item
      @life_item = LifeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def life_item_params
      params.require(:life_item).permit(:title, :date)
    end
end
