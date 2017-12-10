require "administrate/field/base"

class MarkdownField < Administrate::Field::Base
  def to_s
    parser.render(data)
  end

  private

  def parser
    @_parser ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
