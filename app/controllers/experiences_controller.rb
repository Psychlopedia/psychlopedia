class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :edit, :destroy]
  before_action :check_admin, only: [:edit, :destroy]
  before_action :has_permission_to_vote, only: [:update]

  def index
    @experiences = Experience.from_locale.paginate(page: params[:page])
  end

  def show
    @page_title = "Psychlopedia - #{@experience.title}"
  end

  def update
    if params[:experience][:hearts].present?
      rate_experience(params[:experience][:hearts])
    else
      if logged_in? && @experience.update(experience_params)
        redirect_to @experience, notice: t('experiences.show.admin.update_successful')
      else
        render action: 'edit'
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

  # administrative actions

  def edit
    @experience.cocktails.build if @experience.cocktails.empty?
  end

  def destroy
    @experience.destroy
    redirect_to admin_path
  end

  private

  def set_experience
    @experience = Experience.from_locale.friendly.find(params[:id])
  end

  def experience_params
    permitted = params.require(:experience).permit(:title, :pseudonym, :body, :set, :setting, :is_licensed, :locale,
                                                   cocktails_attributes: [:id, :substance, :dosage])
    permitted.delete_if { |key, value| value.blank? }
  end

  def has_permission_to_vote
    # ignore normal updates. this is fucking ugly, man.
    return true if params[:experience][:hearts].blank?

    unless cookies.signed[:votes_left].present?
      cookies.signed[:votes_left] = { value: 5, expires: 24.hours.from_now }
    end

    available_votes = cookies.signed[:votes_left]

    if !available_votes.zero? && available_votes <= 5
      cookies.signed[:votes_left] -= 1
      return true
    else
      redirect_to experiences_path, notice: t('experiences.show.rate_limit_reached')
    end
  end

  def check_admin
    redirect_to experiences_path unless logged_in?
  end

  def rate_experience(rating)
    rating = rating.to_i

    if @experience.hearts[rating].blank?
      @experience.hearts[rating] = 1
    else
      @experience.hearts[rating] += 1
    end

    if @experience.save
      redirect_to @experience, notice: t('experiences.show.rate_successful')
    else
      render action: 'edit'
    end
  end
end
