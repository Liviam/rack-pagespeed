require File.dirname(__FILE__) + '/../spec_helper'

describe 'memcached storage' do
  before :all do
    Rack::PageSpeed::Config # load all storage mechanisms
    @store = Rack::PageSpeed::Store::Memcached.new
    @client = @store.instance_variable_get(:@client)
  end
    
  context 'writing' do
    it "writes with a Hash-like syntax" do
      @client.should_receive(:set).with('omg', 'value')
      @store['omg'] = "value"
    end
  end
  
  context 'reading' do
    it "reads with a Hash-like syntax" do
      @client.set 'hola', 'Hola mundo'
      @store['hola'].should == "Hola mundo"
    end
  end
end