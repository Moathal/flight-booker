module ApplicationHelper
  def flights_active
    current_page?(flights_path) || current_page?(root_path) ? "active" : ""
  end

  def login_active
    current_page?(new_passenger_session_path) ? "active" : ""
  end

  def tickets_active
    current_page?(tickets_path) ? "active" : ""
  end
end
