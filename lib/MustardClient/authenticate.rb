module MustardClient
  class Authenticate < MustardClient

    def authenticate(username, password)

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + '/authenticate'
      command[:params] = {username: username, password: password}

      execute(command)

    end
  end
end
