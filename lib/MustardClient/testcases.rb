require 'MustardClient/client'
module MustardClient
  class TestcasesClient < Client

    def find testcase_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/testcases/#{testcase_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add testcase_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/testcases"
      command[:params] = {testcase: testcase_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete testcase_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/testcases/#{testcase_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update testcase_id, testcase_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/testcases/#{testcase_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {testcase: testcase_params}

      execute(command)

    end

    def import project_id, json, preview: false, update: false

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/projects/#{project_id}/import"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = { update: update, json: json}

      execute(command)

    end

    def parse project_id, file

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/projects/#{project_id}/parse"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = { file: file}

      execute(command)

    end

    def export project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}/testcases/export.xlsx"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end
  end
end
