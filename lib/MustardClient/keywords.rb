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

    def add keyword_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/keywords"
      command[:params] = {keyword: keyword_params}
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

    def update keyword_id, keyword_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/keywords/#{keyword_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {keyword: keyword_params}

      execute(command)

    end

  end
end
