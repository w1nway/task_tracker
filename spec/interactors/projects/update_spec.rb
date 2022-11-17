require "rails_helper"

describe Projects::Update do
  describe ".organized" do
    let(:expected_interactors) do
      [
        Projects::Update::Execute,
        Projects::Update::SendNotification
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
