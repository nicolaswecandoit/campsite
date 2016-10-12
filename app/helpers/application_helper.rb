module ApplicationHelper

  def gender_lists
    I18n.t(:gender_lists).map { |key, value| [ value, key ] }
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end

end
