module Users
  class Create
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = user

      # context.fail!(error: "Invalid data") unless user.update(user_params)
      context.fail!(error: "Invalid data") unless user.save
    end

    private

    def user
      @user ||= User.new(user_params)
    end
  end
end
