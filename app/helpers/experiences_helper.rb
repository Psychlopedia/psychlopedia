module ExperiencesHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true)
    markdown.render(text).html_safe
  end

  def titleize(title)
    title.split.map(&:capitalize).join(' ')
  end

  def image_url(image_name)
    URI.join(root_url, image_path(image_name))
  end
end
