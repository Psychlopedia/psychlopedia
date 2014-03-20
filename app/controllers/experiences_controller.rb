class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show]

  def index
    @experiences = Experience.all
  end

  def show; end

  def random
    @experience = Experience.random

    if @experience
      render :show
    else
      redirect_to experiences_url
    end
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)

    if gotcha_valid? && @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def about; end

  private

  def set_experience
    @experience = Experience.friendly.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:pseudonym, :title, :body)
  end
end
