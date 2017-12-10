require "administrate/field/base"

class SelectField < Administrate::Field::Base
  def to_s
    data
  end

  def choices
    choices = options.fetch(:choices)

    choices.zip(choices)
  end

  def selected_choice
    data
  end
end
