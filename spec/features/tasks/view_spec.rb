require 'rails_helper'

RSpec.describe 'View a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project') }
  let(:task) { create(:task, project: project, title: 'A test task1231231231', user_id: current_user) }

  scenario 'User views a task' do
    visit task_url(task)

    expect(page).to have_content('A test task1231231231')
  end
end
