require File.dirname(__FILE__) + "/spec_helper"
require File.join(File.dirname(__FILE__), '../lib/rest_shifter/shifter.rb')

describe RestShifter do

  def app
    Shifter.set :path_to_flavors, File.join(File.dirname(__FILE__), "../../spec/flavors")
  end

  describe Shifter do
    describe "Get Operations" do
      it "Endpoint for get" do
        get '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

      it "Known bug: Return 400 when has no endpoint with specified accept" do
        header 'Accept', 'application/xml'
        get '/notfound'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to eq("<h1>Not Found</h1>")
        expect(last_response.headers['Content-Type']).to eq("text/html;charset=utf-8")
      end

      it "Should choose right endpoint based on accept header - text" do
        header 'Accept', 'text'
        get '/notfound'
        expect(last_response.status).to eq(201)
        expect(last_response.body).to eq("This is just a text")
        expect(last_response.headers['Content-Type']).to eq("text/plain;charset=utf-8")
      end

      it "Should choose right endpoint based on accept header - json" do
        header 'Accept', 'application/json'
        get '/notfound'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("Found")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

    end
    describe "Post operations" do
      it "Endpoint for post" do
        post '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

      it "Common endpoint with get should behave like post when using post" do
        post '/notfound'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to eq("Not Found")
        expect(last_response.headers['Content-Type']).to eq("application/foo.company.product.type-version+json")
      end

    end
    describe "Special behaviours" do
      it "Service should sleep for a second" do
        time = Time.now
        get '/sleep'
        expect(Time.now - time).to be > 1
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("This should sleep for one second")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end
    end
  end
end
