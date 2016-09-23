module MustardClient
  class Executions < MustardClient

    def find execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def close execution_id

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/executions/#{execution_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete execution_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/executions/#{execution_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end
end
