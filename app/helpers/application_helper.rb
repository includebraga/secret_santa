module ApplicationHelper
  def error_field(model, attr)
    return nil if model.errors.empty?

    content_tag :span, class: "ErrorField" do
      model.errors[attr].map(&:capitalize).join(". ")
    end
  end
end
