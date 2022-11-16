require "rails_helper"

describe Projects::Destroy::Execute do
  describe ".call" do
    let(:interactor) { described_class.new(project: project) }
    let!(:project) { create :project }

    context "when project is created" do
      it { expect { interactor.run }.to change(Project, :count).by(-1) }
    end

    # context "when project is nil instance" do
    #   let(:project) { Project = nil }

    #   it { expect { interactor.run }.to be_an_instance_of NilClass }
    # end

    context "when project destroyed in interactor" do
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
