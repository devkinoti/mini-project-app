class TasksController < ApplicationController
  set_current_tenant_through_filter
  before_action :set_current_account
  layout "dashboard"
  devise_group :project_member, contains: [:user, :team_member]

  before_action :authenticate_project_member!


  # GET /tasks/1 or /tasks/1.json
  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build

    # @available_team_members = []
    # TeamMember.all.each do |team_member|
    #   if team_member.tasks.count < 5
    #     @available_team_members << team_member
    #   end
    # end
    # # byebug
    # @available_team_members
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    # @available_team_members = TeamMemberTaskManager.new.team_member_task_manager(TeamMember.all)
    # @available_team_members = []
    # TeamMember.all.each do |team_member|
    #   if team_member.tasks.count < 5
    #     @available_team_members << team_member
    #   end
    # end
    # # byebug
    # @available_team_members
  end

  # POST /tasks or /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project), notice: "Task was successfully created." }
        
      else
        flash.now[:alert] = "Task has not been created"
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_task_path(@project, @task), notice: "Task was successfully updated." }
      
      else
        flash.now[:alert] = "Task has not been updated"
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_team_member 
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      @task.team_members.delete(params[:team_member_id])
      format.html { redirect_to project_task_path(@project, @task), notice: "Team Member has been successfully removed from the task" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_current_account 
      return unless current_user.present?
      current_account = current_user.account 
      ActsAsTenant.current_tenant = current_account
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :end_date, :start_date, :status, team_member_ids: [])
    end
end
