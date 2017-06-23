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

    def update execution_id, execution_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/executions/#{execution_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {execution: execution_params}

      execute(command)

    end


    def close execution_id: nil, project_key: nil, new_execution_params: nil

      if project_key
        route = "/executions/close?project_key=#{project_key}"
      else
        route = "/executions/close?execution_id=#{execution_id}"
      end

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + route
      command[:params] = {execution: new_execution_params} if new_execution_params
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

    def next_test execution_id, keywords: [], environment: nil

      keywords = [keywords] unless keywords.kind_of? Array

      command = {}
      command[:method] = :get
      keyword_string = ''
      keyword_string += keywords.map{|keyword| "keyword[]=#{keyword.upcase}"}.join('&') unless keywords.blank?
      keyword_string += "#{keyword_string != '' ? '&' : ''}environment=#{environment}"

      if keyword_string != ''
        command[:route] = @mustard_url + "/executions/#{execution_id}/next_test?#{keyword_string}"

      else
        command[:route] = @mustard_url + "/executions/#{execution_id}/next_test"
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
