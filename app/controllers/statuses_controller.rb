class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  # GET /statuses/new
  def new
    @status = Status.new
    @project = Project.find(params[:project_id])
  end

  # GET /statuses/1/edit
  def edit
    @project = Project.new
    @project.id = @status.project_id
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.create(status_params)
    @project = Project.find(@status.project_id)
    @statuses = @project.statuses.all
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to "/projects/" + @status.project.id.to_s, notice: 'Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @project = Project.find(@status.project_id)
    @statuses = @project.statuses.all
    @status.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:content, :project_id)
    end
end
