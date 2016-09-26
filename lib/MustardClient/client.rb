module MustardClient
  class Client

    def initialize(url= nil, token=nil)
      @mustard_url = url
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

    end

  end
end