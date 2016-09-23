require "MustardClient/version"
require 'rest-client'

module MustardClient

  class MustardClient

    attr_accessor :mustard_url, :user_token

    @user_token
    @mustard_url

    def initialize
      @mustard_url = 'localhost:8081'
    end

    def set_user_token token
      @user_token = token
    end

    def execute(command)

      raise Exception if command[:method].nil? || command[:route].nil?

      #Suppress errors that return a response
      begin
        if command[:method] == :get
          r = RestClient.get command[:route], command[:headers]
        elsif command[:method] == :post
          r = RestClient.post command[:route], command[:params], command[:headers]
        elsif command[:method] == :put
          r = RestClient.put command[:route], command[:params], command[:headers]
        elsif command[:method] == :delete
          r = RestClient.delete command[:route], command[:headers]
        end
      rescue RestClient::ExceptionWithResponse => e
        r =e.response
      end

      JSON.parse(r)
      #end
    end


  end


end

require 'MustardClient/users'
require 'MustardClient/authenticate'
require 'MustardClient/projects'
require 'MustardClient/testcases'
require 'MustardClient/teams'
require 'MustardClient/environments'
require 'MustardClient/results'
require 'MustardClient/executions'
require 'json'