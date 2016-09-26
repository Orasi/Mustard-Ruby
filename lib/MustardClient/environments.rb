require 'MustardClient/client'
module MustardClient
  class EnvironmentsClient < Client

    def find environment_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/environments/#{environment_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add environment_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/environments"
      command[:params] = {environment: environment_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete environment_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/environments/#{environment_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update environment_id, environment_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/environments/#{environment_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {environment: environment_params}

      execute(command)

    end

  end
end
