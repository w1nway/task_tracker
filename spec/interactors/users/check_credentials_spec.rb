require "rails_helper"

describe Users::CheckCredentials do # rubocop:disable Metrics/BlockLength
  describe ".call" do # rubocop:disable Metrics/BlockLength
    let!(:user) do
      {
        first_name: "test",
        last_name: "test",
        email: "admin@admin.ru",
        password: "123456"
      }
    end

    context "when credentials are valid" do
      let!(:spec_credentials) do
        {
          first_name: "test",
          last_name: "test",
          email: "admin@admin.ru",
          password: "123456"
        }
      end

      let!(:interactor) do
        described_class
          .new(credentials: spec_credentials)
      end

      it "and user params equals to context.credentials" do
        interactor.run

        expect(interactor.context.credentials).to eq(user)
      end
    end

    context "when credentials are invalid" do
      let(:wrong_credentials) do
        {
          first_name: "another first_name for test",
          last_name: "test",
          email: "admin@admin.ru"
        }
      end

      let!(:interactor) do
        described_class
          .new(credentials: wrong_credentials)
      end

      it "and user params isn't equal to context.credentials" do
        interactor.run

        expect(interactor.context.credentials).not_to eq(user)
      end

      let!(:expected_error_message) { [{ message: "Wrong credentials" }] }

      it "throws error" do
        interactor.run

        expect(interactor.context.errors).to eq(expected_error_message)
      end
    end
  end
end
