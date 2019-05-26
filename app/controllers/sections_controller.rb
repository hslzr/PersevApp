class SectionsController < ApplicationController
  def index
    @section = Section.where("name ILIKE ?", "%#{params[:section]}%").first
    redirect_to root_path unless @section
  end
end
