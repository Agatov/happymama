class Admin::PlacesController < AdminController
  def index
    @places = Place.order(:id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new place_params

    if @place.save
      redirect_to admin_places_path
    else
      render :new
    end
  end

  def edit
    @place = Place.find params[:id]
  end

  def update
    @place = Place.find params[:id]

    if @place.update_attributes place_params
      redirect_to admin_places_path
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find params[:id]
    @place.destroy
    redirect_to :back
  end

  private

  def place_params
    params.require(:place).permit!
  end
end