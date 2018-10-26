module ApplicationHelper
  def define_flash_class(type)
    case type
      when "success"
        "alert alert-success" # Green
      when "error"
        "alert alert-danger" # Red
      when "alert"
        "alert alert-warning" # Yellow
      when "notice"
        "alert alert-success" # Blue
      else
        flash_type.to_s
    end
  end
end
