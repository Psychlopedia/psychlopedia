class InfrastructureController < ApplicationController
  def about
    @page_title = "Psychlopedia - #{t('psychlopedia.titles.about_title')}"
  end

  def style
    @page_title = "Psychlopedia - #{t('psychlopedia.titles.style_title')}"
  end

  def legal
    @page_title = "Psychlopedia - #{t('psychlopedia.titles.legal_title')}"
  end

  def privacy
    @page_title = "Psychlopedia - #{t('psychlopedia.titles.privacy_title')}"
  end
end
