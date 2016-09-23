module MustardClient
  class Projects < MustardClient

    def all

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + '/projects'
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def find project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add project_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/projects"
      command[:params] = {project: project_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete project_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/projects/#{project_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update project_id, project_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/projects/#{project_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {project: project_params}

      execute(command)

    end
  end
end
