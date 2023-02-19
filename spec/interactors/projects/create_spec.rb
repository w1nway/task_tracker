require "rails_helper"

describe Projects::Create do
  describe ".organized" do
    let(:expected_interactors) do
      [
        Projects::Save,
        Projects::Create::CreateOwner
      ]
    end

    it "organizes interactors correctly" do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
