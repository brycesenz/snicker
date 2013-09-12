# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Snicker::Application.initialize!

# Overried the Actionview base error rendering for forms
# http://stackoverflow.com/questions/8713479/custom-html-error-wrappers-for-form-elements
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if instance.error_message.kind_of?(Array)
    input_field_name = html_tag.slice!(/(?<=input id=\")[A-Za-z0-9\-\_]+(?=\")/)

    %(#{html_tag}<small class="error #{input_field_name}">#{instance.error_message.join(', ')}</small>).html_safe
  else
    %(#{html_tag}<small class="error #{input_field_name}">#{instance.error_message}</small>).html_safe
  end
end