module PostsHelper
  def render_if(condition, template, record)
    render template, record if condition
  end

  def format_date(datetime)
    datetime.strftime("%b %e, %Y")
  end

  def full_name(user)
    (user.first_name + " " + user.last_name)
  end
end