require File.dirname(__FILE__) + "/spec_helper"
require File.join(File.dirname(__FILE__), '../lib/rest_shifter/shifter.rb')

describe RestShifter do

  def app
    Shifter.set :path_to_flavors, File.join(File.dirname(__FILE__), "../../spec/flavors")
  end

  describe Shifter do
    describe "Get Operations" do
      it "GET: Endpoint for get" do
        get '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

      it "GET: Known bug: Return 400 when has no endpoint with specified accept" do
        header 'Accept', 'application/xml'
        get '/notfound'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to eq("<h1>Not Found</h1>")
        expect(last_response.headers['Content-Type']).to eq("text/html;charset=utf-8")
      end

      it "GET: Should choose right endpoint based on accept header - text" do
        header 'Accept', 'text/plain'
        get '/notfound'
        expect(last_response.status).to eq(201)
        expect(last_response.body).to eq("This is just a text")
        expect(last_response.headers['Content-Type']).to eq("text/plain;charset=utf-8")
      end

      it "GET: Should choose right endpoint based on accept header - json" do
        header 'Accept', 'application/json'
        get '/notfound'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("Found")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

      it "GET: No content type defined on response" do
        get '/nocontenttype'
        expect(last_response.status).to eq(202)
        expect(last_response.body).to eq("no content type defined on response")
        expect(last_response.headers['Content-Type']).to eq("text/html;charset=utf-8")
      end


    end
    describe "Post operations" do
      it "POST: Endpoint for post" do
        post '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

      it "POST: Known bug: Return 400 when has no endpoint with specified accept" do
        header 'Accept', 'application/xml'
        post '/notfound'
        expect(last_response.status).to eq(404)
        expect(last_response.body).to eq("<h1>Not Found</h1>")
        expect(last_response.headers['Content-Type']).to eq("text/html;charset=utf-8")
      end

      it "POST: Should choose right endpoint based on accept header - text" do
        header 'Accept', 'text/plain'
        post '/notfound'
        expect(last_response.status).to eq(201)
        expect(last_response.body).to eq("This is just a text")
        expect(last_response.headers['Content-Type']).to eq("text/plain;charset=utf-8")
      end

      it "POST: Should choose right endpoint based on accept header - json" do
        header 'Accept', 'application/json'
        post '/notfound'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("Found")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end

    end
    describe "Put Operations" do
      it "PUT: Endpoint for put" do
        put '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("put success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end
    end
    describe "Delete Operations" do
      it "DELETE: Endpoint for delete" do
        delete '/ok'
        expect(last_response.status).to eq(200)
        expect(last_response.body).to eq("delete success")
        expect(last_response.headers['Content-Type']).to eq("application/json")
      end
    end
    describe "Special behaviours" do
      describe "Slowliness for timeouts" do
        it "GET: Service should sleep for a second" do
          time = Time.now
          get '/sleep'
          expect(Time.now - time).to be > 1
          expect(last_response.status).to eq(200)
          expect(last_response.body).to eq("This should sleep for one second")
          expect(last_response.headers['Content-Type']).to eq("application/json")
        end
        it "POST: Service should sleep for a second" do
          time = Time.now
          post '/sleep'
          expect(Time.now - time).to be > 1
          expect(last_response.status).to eq(200)
          expect(last_response.body).to eq("This should sleep for one second")
          expect(last_response.headers['Content-Type']).to eq("application/json")
        end
      end
      describe "Return location header" do
        it "POST: Service should return location when specified" do
          time = Time.now
          post '/location'
          expect(last_response.status).to eq(200)
          expect(last_response.location).to eq("http://www.camiloribeiro.com")
          expect(last_response.headers['Content-Type']).to eq("application/json")
        end
        it "GET: Service should return location when specified" do
          time = Time.now
          get '/location'
          expect(last_response.status).to eq(200)
          expect(last_response.location).to eq("http://www.camiloribeiro.com")
          expect(last_response.headers['Content-Type']).to eq("application/json")
        end
      end
      describe "Custom headers" do
        it "GET: Should return headers when specified" do
          get '/headers'
          expect(last_response.status).to eq(200)
          expect(last_response.headers['X-Custom-Header1']).to eq("first custom header content")
          expect(last_response.headers['X-Custom-Header2']).to eq("second custom header")
          expect(last_response.headers['Content-Type']).to eq("application/json")
        end
      end
    end
  end
end
