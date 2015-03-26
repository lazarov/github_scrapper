require 'spec_helper'

describe GithubScrapperApi do

  def app
    GithubScrapperApi
  end

  describe 'PUT job' do
    before do
      ScrappJob.stub_chain(:new, :async, :perform).and_return(nil)
    end

    subject do
      put 'job/login', params = mock_params
    end

    context 'wrong params' do
      let(:mock_params) { nil }
      it { subject.status.should == 400 }
    end

    context 'correct params' do
      let(:mock_params) { { :login => 'Wlojtek' } }
      it { subject.status.should == 200 }
    end
  end

  describe 'GET ping' do
    it 'returns pong' do
      get '/ping'
      last_response.body.should == "\"pong\""
    end
  end

end
