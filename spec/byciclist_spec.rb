require 'sinatra'
require 'sinatra/bicyclist'

set :routes_to_cycle_through, {
    one: [:foo],
    two: [:bar, :baz]
}

RSpec.describe Sinatra::Application do

  context '_cycle' do
    before { get '/_cycle' }
    subject(:response) { last_response }

    it { expect(response.status).to eq(302) }
    it { expect(response.headers).to include('Location' => 'http://example.org/_cycle/one') }


    context 'two' do
      before { get '/_cycle/two' }

      it { expect(response.status).to eq(302) }
      it { expect(response.headers).to include('Location' => 'http://example.org/bar') }
    end
  end
end
