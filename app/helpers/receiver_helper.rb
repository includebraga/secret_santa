module ReceiverHelper
  def convert_line_breaks_to_html(receiver)
    receiver.letter.gsub(/(?:\n\r?|\r\n?)/, "<br>")
  end
end
