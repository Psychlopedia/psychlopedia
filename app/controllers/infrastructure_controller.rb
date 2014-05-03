class InfrastructureController < ApplicationController
  before_action :set_title

  def about; end
  def style; end
  def legal; end
  def privacy; end

  private

  def set_title
    translated_title = t("psychlopedia.titles.#{action_name}_title")
    @page_title = "Psychlopedia - #{translated_title}"
  end
end
