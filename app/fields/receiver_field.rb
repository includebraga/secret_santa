require "administrate/field/base"

class ReceiverField < Administrate::Field::Base
  def to_s
    "#{institution.short_name}#{resource.id}" if institution
  end

  private

  def resource
    @_resource ||= data.first
  end

  def institution
    resource&.institution
  end
end
