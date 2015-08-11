class Admin::WorkshopsController < AdminController
  def index
    @workshops = Workshop.order("category_id, id")
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new workshop_params

    if @workshop.save
      redirect_to admin_workshops_path
    else
      render :new
    end
  end

  def edit
    @workshop = Workshop.find params[:id]
  end

  def update
    @workshop = Workshop.find params[:id]

    if @workshop.update_attributes workshop_params
      redirect_to admin_workshops_path
    else
      render :edit
    end
  end

  def destroy
    @workshop = Workshop.find params[:id]
    @workshop.destroy
    redirect_to :back
  end

  private 

  def workshop_params
    params.require(:workshop).permit!
  end

end