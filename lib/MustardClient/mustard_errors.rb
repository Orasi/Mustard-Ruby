module MustardClient
  class SessionExpiredError < StandardError
    def initialize(msg="Mustard session has expired.  You will need to re-authenticate")
      super(msg)
    end
  end

end
