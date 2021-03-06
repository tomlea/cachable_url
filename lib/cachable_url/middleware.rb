require "cachable_url"

class CachableUrl::Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["QUERY_STRING"] == ''
      env = env.clone
      path, query = env["PATH_INFO"].split("%1f", 2)
      query = CachableUrl.decode(query || "")
      env["PATH_INFO"] = path
      env["QUERY_STRING"] = query
      env["REQUEST_URI"] = CachableUrl.decode(env["REQUEST_URI"])
      @app.call(env)
    else
      @app.call(env)
    end
  end
end