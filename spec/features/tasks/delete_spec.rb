require 'rails_helper'
RSpec.describe 'Delete task', type: :feature do
  include_context 'when user signed in'

  let(:task) { create(:task, title: 'A test task.........', user_id: current_user.id) }

  scenario 'user try to delete a task' do
    visit tasks_path(task)

    click_on 'Destroy'
    expect(page).to have_no_current_path(tasks_path(task))
    expect(page).to have_no_content('A test task')
  end

  context 'when user is not author of the task' do
    let(:task) { create(:task, title: 'A test task.........', user_id: nil) }
    scenario 'user not allowed try to destroy the task' do
      visit tasks_path(task)

      click_on 'Destroy'
      expect(page).to have_current_path(projects_path)
      expect(page).to have_content('not allowed to destroy')
    end
  end
end
