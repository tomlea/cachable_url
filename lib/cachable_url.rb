require "cachable_url/version"

module CachableUrl
  def self.encode(url)
    url.gsub('?', '%1f')
  end

  def self.decode(url)
    url.gsub('%1f', '?')
  end
end
