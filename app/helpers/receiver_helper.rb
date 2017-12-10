module ReceiverHelper
  def letter_html(receiver)
    parser.render(receiver.letter)
  end

  private

  def parser
    @_parser ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
