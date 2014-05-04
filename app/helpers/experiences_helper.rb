module ExperiencesHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true)
    markdown.render(text).html_safe
  end

  def titleize(title)
    title.split.map(&:capitalize).join(' ')
  end

  def truncate_and_titleize(title, length = 40, omission = '...')
    truncate(titleize(title), length: length, omission: omission)
  end
end
