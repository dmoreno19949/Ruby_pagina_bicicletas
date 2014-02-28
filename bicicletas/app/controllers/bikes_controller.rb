class BikesController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  # GET /bikes
  # GET /bikes.json
  def index
    if params[:id].nil?
      @bikes = Bike.paginate(:page => params[:page], :per_page => 2)
    else
      @bikes = Bike.where(:brand_id => params[:id])
      @bikes = @bikes.paginate(:page => params[:page], :per_page => 2)
  end
  end

  # GET /bikes/1
  # GET /bikes/1.json
  def show
    #@brand = Brand.where(:id=Bike.find(params[:id]).brand_id)

  end

  # GET /bikes/new
  def new
    if !current_user.nil?
       @bike=Bike.new
      
    else
    render text: 'no puedes crear onbjetos'
    end 
  end

  # GET /bikes/1/edit
  def edit
  end

  # POST /bikes
  # POST /bikes.json
  def create
        if !current_user.nil?
  
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bike }
      else
        format.html { render action: 'new' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
      end
     else
      render text: 'que te jodan melon'
    end
  end

  # PATCH/PUT /bikes/1
  # PATCH/PUT /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1
  # DELETE /bikes/1.json
  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bikes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end
    #def set_brand
    #  @brand = Brand.find(@bike.brand_id)
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_params
      params.require(:bike).permit(:name, :description, :price, :avatar, :brand_id )
    end
    #def brand_params
     # params.require(:brand).permit(:id,:name)
    #end
end
