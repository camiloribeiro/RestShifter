require File.dirname(__FILE__) + "/spec_helper"
require File.join(File.dirname(__FILE__), '../lib/RestShifter/Shifter.rb')

describe RestShifter do

  def app
    Sinatra::Application
  end

  describe "Get Operations" do
    # Get
    it "Service should return 200 for get" do
      get '/ok'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("success")
      expect(last_response.headers['Content-Type']).to eq("application/json")
    end

    it "Service should return 404 without accept defining routing for get" do
      get '/notfound'
      expect(last_response.status).to eq(404)
      expect(last_response.body).to eq("Not Found")
      expect(last_response.headers['Content-Type']).to eq("application/foo.company.product.type-version+json")
    end

    #  it "Service should return 404 with accept defining routing" do
    #    header 'Accept', "application/foo.company.product.type-version2+json"
    #    get '/notfound'
    #    expect(last_response.status).to eq(404)
    #    expect(last_response.body).to eq("Not Found with accept")
    #    expect(last_response.headers['Content-Type']).to eq("application/foo.company.product.type-version2+json")
    #  end
  end
  describe "Post operations" do

    # Post
    it "Service should return 200 for post" do
      post '/ok'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("success")
      expect(last_response.headers['Content-Type']).to eq("application/json")
    end

    it "Service should return 404 without accept defining routing for post" do
      post '/notfound'
      expect(last_response.status).to eq(404)
      expect(last_response.body).to eq("Not Found")
      expect(last_response.headers['Content-Type']).to eq("application/foo.company.product.type-version+json")
    end

  end
end
