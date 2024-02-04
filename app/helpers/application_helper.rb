module ApplicationHelper
  def flash_message
    return unless flash.present?

    flash.each do |type, message|
      if type == 'notice'
        return content_tag(:p, message, style: 'color: green;')
      elsif type == 'alert'
        return content_tag(:p, message, style: 'color: red;')
      end
    end
  end
end
