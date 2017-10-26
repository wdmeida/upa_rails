module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? 'active': ''
  end

  def has_errors?(object, field, class_error)
    !object.errors.messages[field].empty? ? class_error : ''
  end
end
