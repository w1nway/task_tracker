require "rails_helper"

describe Projects::Update::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project, project_params: params) }
    let(:project) { create :project }
    let(:params) do
      {
        name: "test",
        description: "test description"
      }
    end

    context "when the project was updated" do
      it { expect { interactor.run }.to change(project, :updated_at) }
    end

    context "when the project wasn't updated" do
      let(:expected_error_message) { "Invalid Data" }

      before do
        allow(project).to receive(:update).and_return(false)
      end

      it do
        interactor.run
        expect(interactor.context.error).to eq(expected_error_message)
      end
    end
  end
end
