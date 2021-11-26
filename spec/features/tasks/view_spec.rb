require 'rails_helper'

RSpec.describe 'View a task', type: :feature do
  include_context 'when user signed in'

  let(:task) { create(:task, title: 'A test task', description: 'A test description', deadline_at: 'November 27, 2021 23:59') }

  scenario 'User views a task' do
    visit task_url(task)

    expect(page).to have_content('A test task')
    expect(page).to have_content('A test description')
    expect(page).to have_content('November 27, 2021 23:59')
  end
end

