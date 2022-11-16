require "rails_helper"

describe Projects::Create::SendNotification do
  include ActiveJob::TestHelper

  describe ".call" do
    context "with correct params" do
      let(:interactor) { described_class.new(project: project, user: user) }
      let(:user) { create :user, first_name: "test", last_name: "test", email: "admin@admin.ru", role: "member" }
      let(:project) { create :project }

      before do
        # эта строчка нужна для того, чтобы позволить ProjectMailer-у вызвать метод
        # project_created, так как по умолчанию мейлеры в тестах не вызываются
        allow(ProjectMailer).to receive(:project_created).and_call_original
      end

      after do
        # это действие нужно, чтобы очистить список запланированных джобов,
        # чтобы они не повлияли на другие тесты
        clear_enqueued_jobs
      end

      it "sends mail" do
        expect(ProjectMailer).to receive(:project_created)

        # эта проверка нужна, чтобы удостовериться в том, что команда deliver_later
        # выполнилась и отправка письма попала в очередь на исполнение
        expect { interactor.run }.to change(enqueued_jobs, :size).by(1)
      end
    end
  end
end
