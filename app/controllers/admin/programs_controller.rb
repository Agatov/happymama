class Admin::ProgramsController < AdminController

  before_action :find_workshop

  def index
    @programs = @workshop.workshop_course_programs
  end

  def new
    @program = WorkshopCourseProgram.new
  end

  def create
    @program = @workshop.workshop_course_programs.build program_params

    if @program.save
      redirect_to admin_workshop_programs_path(@workshop)
    else
      render :new
    end
  end

  def edit
    @program = WorkshopCourseProgram.find params[:id]
  end

  def update
    @program = WorkshopCourseProgram.find params[:id]

    if @program.update_attributes program_params
      redirect_to admin_workshop_programs_path(@workshop)
    else
      render :edit
    end
  end

  def destroy
    @program = WorkshopCourseProgram.find params[:id]
    @program.destroy
    redirect_to :back
  end

  private

  def find_workshop
    @workshop = Workshop.find params[:workshop_id]
  end

  def program_params
    params.require(:workshop_course_program).permit!
  end
end