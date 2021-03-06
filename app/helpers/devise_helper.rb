module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?
    
    messages = resource.errors.full_messages.map {|msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)
    
    html = <<-HTML
    <div id="errors" class="col-xs-12 alert alert-danger"
      <h3>#{sentence}</h3>
      <ul>#{messages}</ul>
    </div>
    HTML
    
    html.html_safe
  end
  
  def devise_error_messages?
    resource.error.empty? ? false : true
  end
end