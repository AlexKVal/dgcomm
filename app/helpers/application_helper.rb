module ApplicationHelper
  def short_name(name)
    name.split(' ')[0..3].join(' ')
  end
end
