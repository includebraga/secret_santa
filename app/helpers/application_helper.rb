module ApplicationHelper
  def error_field(model, attr)
    return nil if model.errors.empty?

    content_tag :span, class: "ErrorField" do
      model.errors[attr].map(&:capitalize).join(". ")
    end
  end

  # Shorthand helper for react components
  # Only use prerender in test and prod environments, even if it's set to true
  def render_react_component(component:, props: nil, prerender: false)
    react_component(component, props, prerender: Rails.env.development? ? false : prerender)
  end
end
