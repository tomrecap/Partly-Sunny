module ApplicationHelper

  def insert_form_authenticity_token
    '<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">'.html_safe
  end

  def change_post_to_put
    '<input type="hidden" name="_method" value="PUT">'.html_safe
  end

end
