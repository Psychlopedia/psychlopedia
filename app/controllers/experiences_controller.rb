class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update]

  def index
    @experiences = Experience.all
  end

  def show; end

  def update
    rating = params[:experience][:hearts]

    if @experience.hearts[rating].nil?
      @experience.hearts[rating] = 1
    else
      @experience.hearts[rating] += 1
    end

    if @experience.save
      redirect_to experience_path(@experience), notice: '¡La experiencia ha sido puntuada!'
    else
      redirect_to experience_path(@experience), notice: 'No se ha podido puntuar la experiencia. ¿Probarías de nuevo?'
    end
  end

  def random
    @experience = Experience.random

    if @experience.present?
      render :show
    else
      redirect_to experiences_url
    end
  end

  def new
    @experience = Experience.new
  end

  def create
    if gotcha_valid?
      @experience = Experience.create(experience_params)
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
    experience = params.require(:experience)
    attributes = [:pseudonym, :title, :body].reject { |attribute| experience[attribute].blank? }
    experience.permit(*attributes)
  end
end
