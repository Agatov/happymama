class Admin::TeachersController < AdminController
  def index
    @teachers = Teacher.order(:number)
  end

  def new
    @teacher = Teacher.new
    @teacher.teacher_diploms.build
  end

  def create
    @teacher = Teacher.new teacher_params

    if @teacher.save 
      redirect_to admin_teachers_path
    else
      render :new
    end
  end

  def edit
    @teacher = Teacher.find params[:id]
  end

  def update
    @teacher = Teacher.find params[:id]

    if @teacher.update_attributes teacher_params
      redirect_to admin_teachers_path
    else
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find params[:id]
    @teacher.destroy
    redirect_to :back
  end

  private

  def teacher_params
    params.require(:teacher).permit!
  end
end