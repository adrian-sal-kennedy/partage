module ApplicationHelper
  def clean_url(url)
    url.to_s =~ /http/ ? url : "http://"+url
  end
end
