module ApplicationHelper

  def gender_lists
    I18n.t(:gender_lists).map { |key, value| [ value, key ] }
  end
  
end
