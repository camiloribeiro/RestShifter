require File.dirname(__FILE__) + "/spec_helper"
require File.join(File.dirname(__FILE__), '../lib/RestShifter/Shifter.rb')

describe RestShifter do

  def app
    Sinatra::Application
  end

  it "Service should return 200" do
    get '/hi'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq("Hello World!")
  end

end
