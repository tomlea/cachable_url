require "cachable_url/version"

module CachableUrl
  def self.encode(url)
    url.gsub('?', '%1F')
  end

  def self.decode(url)
    url.gsub('%1F', '?')
  end
end
