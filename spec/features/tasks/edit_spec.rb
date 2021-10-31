require 'rails_helper'

RSpec.describe 'Edit a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, user: current_user) }
  let(:task) { create(:task, project: project, title: 'A test task1231231231', user_id: current_user.id) }

  scenario 'user edit a task' do
    visit edit_task_path(task)

    save_and_open_page

    fill_in 'Title', with: 'A new name for the task'
    fill_in 'Description', with: 'Another description'

    click_button 'Save'

    expect(page).to have_current_path(tasks_path(task))
    expect(page).to have_content('New name for the task')
    expect(page).to have_content('Another description')
  end

  context 'when user is not author of the task' do
    let(:project) { create(:project, user: current_user) }
    let(:task) { create(:task, project: project, title: 'A test task1231231231', user_id: current_user.id + 1) }

    scenario 'user tries to edit the task' do
      visit edit_task_path(task)

      expect(page).to have_current_path(projects_path)
      expect(page).to have_content('not allowed')
    end
  end
end
