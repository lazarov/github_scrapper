require 'sucker_punch'
require_relative 'github_api'

class ScrappJob
  include SuckerPunch::Job

  def perform(login)
    github = GithubApi.new
    user = github.user(login)
    following = github.following(login)
    followers = github.followers(login)
    binding.pry
    #puts following
  end


end

#ScrappJob.new.perform('Wlojtek')
