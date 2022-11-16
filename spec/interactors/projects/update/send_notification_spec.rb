require "rails_helper"

describe Projects::Update::SendNotification do
  include ActiveJob::TestHelper

  describe ".call" do
    context "with correct params" do
      let(:interactor) { described_class.new(project: project) }
      let(:project) { create :project }

      before do
        allow(ProjectMailer).to receive(:project_updated).and_call_original
      end

      after do
        clear_enqueued_jobs
      end

      it "sends mail" do
        expect(ProjectMailer).to receive(:project_updated)

        expect { interactor.run }.to change(enqueued_jobs, :size).by(1)
      end
    end
  end
end
