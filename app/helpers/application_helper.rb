require 'redcarpet'

module ApplicationHelper
  def markdown_render(text)
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @renderer.render(text)
  end
end
