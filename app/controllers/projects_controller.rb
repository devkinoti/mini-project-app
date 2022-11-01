class ProjectsController < ApplicationController
  set_current_tenant_through_filter
  before_action :set_current_account
  layout "dashboard"
  before_action :authenticate_user!
  
  
  # before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.order(created_at: :desc)
  end

  # GET /projects/1 or /projects/1.json
  def show
    load_project
  end

  # GET /projects/new
  def new
    @project = Project.new
    # byebug
  end

  # GET /projects/1/edit
  def edit
    load_project
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user


    respond_to do |format|
      if @project.save
        byebug
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
       
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = load_project 

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
  
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_project
      @project = Project.find(params[:id])
    end

    def set_current_account 
      return unless current_user.present?
      current_account = current_user.account 
      ActsAsTenant.current_tenant = current_account
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(
        :project_name, 
        :description,
        :project_number
      )
    end
end
