require 'MustardClient/client'
module MustardClient
  class ResultsClient < Client

    def find result_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/results/#{result_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add result_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/results"
      command[:params] = {result: result_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def screenshot result_id, screenshot_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/results/#{result_id}/screenshot/#{screenshot_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end
end
