class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores or /stores.json
  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true)  
  end

  # GET /stores/1 or /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores or /stores.json
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_url(@store), notice: "Store was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    if @store.update(store_params)
        redirect_to store_url(@store), notice: "Store was successfully created."
    else
        render :new, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy
    redirect_to stores_url, notice: "Store was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :street, :city, :state, :country, :photo, :latitude, :longitude, products_attributes: [:id, :name, :description, :price, :_destroy, :photo, variants_attributes: [:id, :name, :_destroy, variant_options_attributes: [:id, :name, :_destroy]]])  end
end
