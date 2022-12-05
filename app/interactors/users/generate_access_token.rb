module Users
  class GenerateAccessToken
    include Interactor

    delegate :user, to: :context

    def call
      context.access_token = access_token
    end

    private

    def access_token
      JWT.encode(payload, jwt_secret, "HS256")
    end

    def jwt_secret
      ENV.fetch("JWT_SECRET")
    end

    def payload
      {
        sub: user.id
      }
    end
  end
end
