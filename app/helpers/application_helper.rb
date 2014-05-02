module ApplicationHelper
  def page_title
    @page_title || 'Psychlopedia'
  end

  def relocalize_url(locale)
    naked_url, params = request.original_url.split('?')
    if params
      relocalized_params = params.split('&').delete_if { |param| param =~ /locale/ }
      relocalized_params << "locale=#{locale}"
      "#{naked_url}?#{relocalized_params.join('&')}"
    else
      "#{naked_url}?locale=#{locale}"
    end
  end
end
