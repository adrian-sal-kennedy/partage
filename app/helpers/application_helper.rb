module ApplicationHelper
  def clean_url(url)
    url.to_s =~ /http/ ? url : "https://"+url
  end
  # below not really needed anymore but I'll keep it here in case we wanna mess with direct-linking outside pics.
  def get_picture(pic_url)
    require "net/http"
    if Rails.application.assets.find_asset(pic_url) == nil
      return "no-pic.svg" if (pic_url == "" || pic_url == nil)
      url = URI.parse(clean_url(pic_url))
      pic_url
      request = Net::HTTP.new(url.host, url.port)
      request.use_ssl = true
      return "no-pic.svg" if url.path == ( "" || nil )
      return pic_url
    end
  end
end
