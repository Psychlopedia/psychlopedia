class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :update, :edit, :destroy]
  before_action :check_admin, only: [:edit, :destroy]
  before_action :has_permission_to_vote, only: [:update]
  before_action :set_title, only: [:index, :new, :show, :search]

  def index
    @experiences = Experience.approved.paginate(page: params[:page])
  end

  def show; end

  def update
    if logged_in? && @experience.update(experience_params)
      redirect_to @experience, notice: t('experiences.show.admin.update_successful')
    else
      render action: 'edit'
    end
  end

  def new
    @experience = Experience.new
    @experience.cocktails.build
  end

  def create
    @experience = Experience.new(experience_params)
    if gotcha_valid? && @experience.save
      redirect_to experiences_path, notice: t('experiences.waiting_for_approval')
    else
      render :new
    end
  end

  def search
    @query = extract_and_sanitize_query
    @results = Experience.search(@query)
  end

  def on_category
    @results = Category.find_or_create_by(name: params[:name]).experiences
    render :categories
  end

  def edit
    @experience.cocktails.build if @experience.cocktails.empty?
  end

  def destroy
    @experience.destroy
    redirect_to admin_path
  end

  private

  def set_experience
    @experience = Experience.friendly.approved.find(params[:id]) rescue Experience.none
  end

  def set_title
    if params[:query]
      translated_title_for_action = t("experiences.#{action_name}_title", query: extract_and_sanitize_query)
    elsif action_name == 'show'
      translated_title_for_action = t("experiences.#{action_name}_title", experience_title: @experience.title.split.map(&:capitalize).join(' '))
    else
      translated_title_for_action = t("experiences.#{action_name}_title")
    end
    @page_title = "Psychlopedia - #{translated_title_for_action}"
  end

  def extract_and_sanitize_query
    params[:query].downcase.parameterize
  end

  def experience_params
    permitted = params.require(:experience).permit(:title, :pseudonym, :body, :set, :setting, :locale,
                                                   cocktails_attributes: [:id, :substance, :dosage])
    permitted.delete_if { |key, value| value.blank? }
  end

  def check_admin
    redirect_to experiences_path unless logged_in?
  end
end
