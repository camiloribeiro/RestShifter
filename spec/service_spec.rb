require File.dirname(__FILE__) + "/spec_helper"
require File.join(File.dirname(__FILE__), '../lib/RestShifter/Shifter.rb')

describe RestShifter do

  def app
    Sinatra::Application
  end

  it "Service should return 200" do
    get '/ok'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("success")
  end

  it "Service should return 404" do
    get '/notfound'
    expect(last_response.status).to eq(404)
    expect(last_response.body).to eq("Not Found")
  end

end
