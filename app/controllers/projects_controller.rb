class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'projects/print.pdf',
               disposition: :inline,
               pdf: @project.name,
               layout: 'pdfs/base.html.slim'
      end
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
  def set_project
    @project = Project
      .includes(:user)
      .with_attached_images
      .with_attached_documents
      .find(params[:id])
  end

  def project_params
    params.require(:project)
      .permit(:name, :user_id, :what_todo, :how_todo, :why_todo,
              :general_objective, :particular_objective,
              images: [], documents: [])
  end
end
