module MustardClient
  class Teams < MustardClient

    def all

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + '/teams'
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def find team_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/teams/#{team_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add team_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/teams"
      command[:params] = {team: team_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete team_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/teams/#{team_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update team_id, team_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/teams/#{team_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {team: team_params}

      execute(command)

    end

    def add_user team_id, user_id

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/teams/#{team_id}/user/#{ user_id }"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add_project team_id, project_id

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/teams/#{team_id}/project/#{ project_id }"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def remove_user team_id, user_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/teams/#{team_id}/user/#{ user_id }"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def remove_project team_id, project_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/teams/#{team_id}/project/#{ project_id }"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end
end
