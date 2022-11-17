require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }
    let!(:project) { create :project }

    context "when the project was destroyed" do
      it { expect { interactor.run }.to change(Project, :count).by(-1) }
    end

    context "when the project wasn't destroyed" do
      let(:expected_error_message) { "Invalid Data" }

      before do
        allow(project).to receive(:destroy).and_return(false)
      end

      it do
        interactor.run
        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
