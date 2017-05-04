require 'MustardClient/client'
module MustardClient
  class KeywordsClient < Client

    def find keyword_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/keywords/#{keyword_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add keyword_params, testcase_ids: false

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/keywords"

      if testcase_ids
        command[:params] = {keyword: keyword_params, testcase_ids: testcase_ids}
      else
        command[:params] = {keyword: keyword_params}
      end

      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete keyword_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/keywords/#{keyword_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update keyword_id, keyword_params, testcase_ids: false

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/keywords/#{keyword_id}"
      command[:headers] = {'User-Token' => @user_token}

      if testcase_ids
        command[:params] = {keyword: keyword_params, testcase_ids: testcase_ids}
      else
        command[:params] = {keyword: keyword_params}
      end

      execute(command)

    end

  end
end
