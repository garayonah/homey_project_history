class ProjectHistoriesController < ApplicationController
  before_action :set_project_history, only: %i[ show ]

  # GET /project_histories or /project_histories.json
  def index
    @project_histories = ProjectHistory.all
  end

  # GET /project_histories/1 or /project_histories/1.json
  def show
  end

  # GET /project_histories/new
  def new
    @project_history = ProjectHistory.new
  end

  # POST /project_histories or /project_histories.json
  def create
    @project = Project.find(project_history_params[:project_id])
    new_project_history_params = project_history_params.merge(
      user_id: Current.session.user_id,
      status_before: @project.status,
      status_after: project_history_params[:status_after].presence||@project.status)
    @project_history = ProjectHistory.new(new_project_history_params)

    respond_to do |format|
      if @project_history.save
        @project.update(status: @project_history.status_after)
        format.html { redirect_to @project, notice: "Project history was successfully added." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_history.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_history
      @project_history = ProjectHistory.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def project_history_params
      params.expect(project_history: [ :project_id, :comment, :status_after ])
    end
end
