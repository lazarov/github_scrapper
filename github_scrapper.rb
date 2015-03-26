require 'grape'
require 'json'
require './scrapp_job'

class GithubScrapperApi < Grape::API
  format :json

  resource :job do
    desc 'put github scrapp job'

    params do
      requires :login, type: String, desc: "A user github login"
    end

    put :login do
      binding.pry
      ScrappJob.new.async.perform(params[:login])
    end
  end

  get :ping do
    :pong
  end
end
