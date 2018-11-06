module ReceiverHelper
  # Convert DOS, *NIX and MacOs
  def letter_html(receiver)
    receiver.letter.gsub(/(?:\n\r?|\r\n?)/, "<br>")
  end
end
