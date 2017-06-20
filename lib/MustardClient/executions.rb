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


    def keyword_summary execution_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/executions/#{execution_id}/keyword_summary"
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

    def next_test execution_id, keywords: []

      keywords = [keywords] unless keywords.kind_of? Array

      command = {}
      command[:method] = :get

      if keywords.blank?
        command[:route] = @mustard_url + "/executions/#{execution_id}/next_test"
      else
        keywords_string = keywords.map{|keyword| "keyword[]=#{keyword.upcase}"}.join('&')
        command[:route] = @mustard_url + "/executions/#{execution_id}/next_test?#{keywords_string}"
      end

      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def incomplete_tests execution_id, keywords: []

      keywords = [keywords] unless keywords.kind_of? Array

      command = {}
      command[:method] = :get

      if keywords.blank?
        command[:route] = @mustard_url + "/executions/#{execution_id}/incomplete_tests"
      else
        keywords_string = keywords.map{|keyword| "keyword[]=#{keyword.upcase}"}.join('&')
        command[:route] = @mustard_url + "/executions/#{execution_id}/next_test?#{keywords_string}"
      end

      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end

  private

  def parse_keywords keyword
    if keyword.kind_of? Array
      return keyword
    else
      return [keyword]
    end
  end
end
