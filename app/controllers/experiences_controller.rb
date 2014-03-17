class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show]

  def index
    @experiences = Experience.all
  end

  def show; end

  def random
    @experience = Experience.random
    render :show
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.create(experience_params)
    redirect_to experience_path(@experience)
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:pseudonym, :title, :body)
  end
end
