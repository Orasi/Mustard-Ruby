require 'MustardClient/client'
module MustardClient
  class ProjectsClient < Client

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

    def environments project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}/environments"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def keywords project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}/keywords"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def testcases project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}/testcases"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def executions project_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/projects/#{project_id}/executions"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

  end
end
