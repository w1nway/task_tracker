module Users
  class CheckCredentials
    include Interactor

    delegate :credentials, to: :context

    def call
      context.fail!(errors: errors) unless user_authenticated?

      context.user = user
    end

    private

    def errors
      [{ message: "Wrong credentials" }]
    end

    def user
      @user ||= User.find_by(email: credentials[:email])
    end

    def user_authenticated?
      user&.authenticate(credentials[:password])
    end
  end
end
