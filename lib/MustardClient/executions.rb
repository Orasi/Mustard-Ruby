require 'MustardClient/client'
module MustardClient
  class ExecutionsClient < Client


    def environment_detail execution_id, environment_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/environment/#{environment_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def testcase_detail execution_id, testcase_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/testcases/#{testcase_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def testcase_summary execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/testcase_summary"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def environment_summary execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/environment_summary"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def testcase_status execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/testcase_status"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


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
