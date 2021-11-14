require 'rails_helper'
RSpec.describe 'View a task', type: :feature do
  include_context 'when user signed in'
  let(:task) { create(:task, title: 'A test task.........', user_id: current_user.id) }

  scenario 'User views a task' do
    visit task_url(task)
    expect(page).to have_content('A test task.........')
  end
end