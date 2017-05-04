require "MustardClient/version"
require 'rest-client'
require 'MustardClient/users'
require 'MustardClient/authenticate'
require 'MustardClient/projects'
require 'MustardClient/testcases'
require 'MustardClient/teams'
require 'MustardClient/environments'
require 'MustardClient/results'
require 'MustardClient/executions'
require 'MustardClient/keywords'
require 'json'

module MustardClient

  class Mustard

    attr_accessor :mustard_url, :user_token

    @user_token
    @mustard_url

    def initialize(url= 'localhost:8081', token=nil)
      @mustard_url = url
      @user_token = token
    end

    def set_user_token token
      @user_token = token
    end

    def set_mustard_url url
      @mustard_url = url
    end

    def authenticate(username, password)
      a = AuthenticateClient.new(@mustard_url, @user_token)
      r = a.authenticate(username, password)
      unless r['error']
        @user_token = r['user']['token']
      end

      return r
    end

    def users
      UsersClient.new(@mustard_url, @user_token)
    end

    def projects
      ProjectsClient.new(@mustard_url, @user_token)
    end

    def testcases
      TestcasesClient.new(@mustard_url, @user_token)
    end

    def teams
      TeamsClient.new(@mustard_url, @user_token)
    end

    def environments
      EnvironmentsClient.new(@mustard_url, @user_token)
    end

    def results
      ResultsClient.new(@mustard_url, @user_token)
    end

    def executions
      ExecutionsClient.new(@mustard_url, @user_token)
    end

    def keywords
      KeywordsClient.new(@mustard_url, @user_token)
    end


  end


end
