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


    def testcase_status execution_id, format=nil

      command = {}
      command[:method] = :get
      if format
        command[:route] = @mustard_url + "/executions/#{execution_id}/testcase_status.#{format}"
      else
        command[:route] = @mustard_url + "/executions/#{execution_id}/testcase_status"
      end
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def testcase_count execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/testcase-count"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end


    def environment_count execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/environment-count"
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


    def close execution_id: nil, project_key: nil, name: nil

      if project_key
        route = "/executions/close?project_key=#{project_key}"
      else
        route = "/executions/close?execution_id=#{execution_id}"
      end

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + route
      command[:params] = {execution: {name: name}} if name
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

    def next_test execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/next_test"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end
end
