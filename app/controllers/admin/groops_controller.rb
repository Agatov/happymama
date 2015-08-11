class Admin::GroopsController < AdminController
  def index
    @groops = Groop.order("id desc")
  end

  def new
    @groop = Groop.new
  end

  def create
    @groop = Groop.new groop_params

    if @groop.save
      redirect_to admin_groops_path
    else
      render :new
    end
  end

  def edit
    @groop = Groop.find params[:id]
  end

  def update
    @groop = Groop.find params[:id]

    if @groop.update_attributes groop_params
      redirect_to admin_groops_path
    else
      render :edit
    end
  end

  def destroy
    @groop = Groop.find params[:id]
    @groop.destroy
    redirect_to :back
  end

  private

  def groop_params
    params.require(:groop).permit!
  end
end