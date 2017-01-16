require 'MustardClient/client'
module MustardClient
  class UsersClient < Client

    def all

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + '/users'
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def find user_id

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/users/#{user_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def find_by_username username

      command = {}
      command[:method] = :get
      command[:route] = @mustard_url + "/users/find/#{ username}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def add user_params

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/users"
      command[:params] = {user: user_params}
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def delete user_id

      command = {}
      command[:method] = :delete
      command[:route] = @mustard_url + "/users/#{user_id}"
      command[:headers] = {'User-Token' => @user_token}

      execute(command)

    end

    def update user_id, user_params

      command = {}
      command[:method] = :put
      command[:route] = @mustard_url + "/users/#{user_id}"
      command[:headers] = {'User-Token' => @user_token}
      command[:params] = {user: user_params}

      execute(command)

    end

    def trigger_password_reset username, redirect_url

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/users/reset-password"
      command[:params] = {user: {username: username}, 'redirect-to' => redirect_url, }

      execute(command)

    end

    def reset_password user_id, password_token, new_password

      command = {}
      command[:method] = :post
      command[:route] = @mustard_url + "/users/#{user_id}/reset-password/#{password_token}"
      command[:params] = {user: {'password' => new_password}}

      execute(command)

    end
  end
end
