module ApplicationHelper
  include PublicHelper
  
  def markdown(text)
    return if text.nil?
    markdown_options = [:autolink => true, :space_after_headers => true, :no_intra_emphasis => true]
    renderer_options = [:hard_wrap => true]
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(*renderer_options), *markdown_options)
    markdown.render(text).html_safe
  end
  
end
