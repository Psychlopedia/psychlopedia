class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update]

  def index
    @experiences = Experience.paginate(page: params[:page])
  end

  def show; end

  def update
    rating = params[:experience][:hearts].to_i

    unless check_rating(rating)
      redirect_to experience_path(@experience), notice: 'La valuación va del 1 al 5. Por favor, intentá puntuar nuevamente.'
    else
      @experience.hearts[rating].nil? ? @experience.hearts[rating] = 1 : @experience.hearts[rating] += 1

      if @experience.save
        redirect_to experience_path(@experience), notice: '¡La experiencia ha sido puntuada!'
      else
        redirect_to experience_path(@experience), notice: 'No se ha podido puntuar la experiencia. ¿Probarías de nuevo?'
      end
    end
  end

  def random
    @experience = Experience.random

    unless @experience.present?
      redirect_to experiences_url
    end
  end

  def new
    @experience = Experience.new
    @experience.cocktails.build
  end

  def create
    if gotcha_valid?
      @experience = Experience.create(experience_params)
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def search
    @query = params[:query].downcase.parameterize
    @results = Experience.search(@query)
  end

  private

  def set_experience
    @experience = Experience.friendly.find(params[:id])
  end

  def experience_params
    experience = params.require(:experience)
    attributes = [:pseudonym, :title, :body, :set, :setting].reject { |attribute| experience[attribute].blank? }
    experience.permit(*attributes)
  end

  def check_rating(rating)
    (1..5).include?(rating)
  end
end
