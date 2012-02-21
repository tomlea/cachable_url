require "spec_helper"

describe CachableUrl::Middleware do
  include Rack::Test::Methods

  let(:requests_received){ [] }

  def app
    logger_app = lambda{|env| requests_received << env; [200, {"Content-Type" => 'text/plain'}, ["Hello world"]] }
    CachableUrl::Middleware.new(logger_app)
  end

  it "should pass through requests with query strings" do
    get "/fooooooo%1f?foo=bar"
  
    requests_received.size.should == 1
    requests_received.last["QUERY_STRING"].should == "foo=bar"
    requests_received.last["PATH_INFO"].should == "/fooooooo%1f"
  end

  it "should decode requests with no query strings" do
    get "/fooooooo%1ffoo=bar"
    
    requests_received.size.should == 1
    requests_received.last["QUERY_STRING"].should == "foo=bar"
    requests_received.last["PATH_INFO"].should == "/fooooooo"
  end

  it "should decode requests with no query strings to the same thing as the query string based request" do
    get "/fooooooo%1ffoo=bar"
    get "/fooooooo?foo=bar"
    
    requests_received.size.should == 2
    a,b = cleanse_responses(*requests_received.last(2))
    a.should == b
  end

  protected
  def cleanse_responses(*args)
    args.map{|r|
      r.delete_if{|key, value|
        ["rack.input", "rack.errors"].include? key
      }
    }
  end

end
