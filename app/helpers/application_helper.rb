module ApplicationHelper
  include PublicHelper
  
  def markdown(text)
    return if text.nil?
    markdown_options = [:autolink => true, :space_after_headers => true, :no_intra_emphasis => true]
    renderer_options = [:hard_wrap => true, :filter_html => true]
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(*renderer_options), *markdown_options)
    markdown.render(text).html_safe
  end
  
  def get_controller(controller)
    controller.split('/').last
  end

  def link_to_add_fields(name, f, association, type="service", color="warning")
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to("<i class='icon-plus-sign icon-white'></i>&nbsp;#{name}".html_safe, '#', class: "add_fields btn btn-mini btn-#{color}", data: {id: id, fields: fields.gsub("\n", ""), type: type})
  end
  
    # used by subnav to check which tab is active
  def nav_item_active?(current_controller)
    'active' if params['controller'] =~ Regexp.new(current_controller)
  end
  
end
