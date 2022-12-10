require "rails_helper"

describe Users::GenerateAccessToken do
  describe ".call" do

    let!(:user) { build :user, email: "user@admin.ru", password: "123456" }
    let!(:interactor) { described_class.new(user: user) }

    it "token is present" do
      interactor.run

      expect(interactor.context.access_token).to be_present
    end

    context "when context contains the user" do
      let!(:interactor) { described_class.new(user: user) }

      it do
        interactor.run

        expect(interactor.context.user).present?
      end
    end
  end
end
