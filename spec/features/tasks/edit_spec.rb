require 'rails_helper'

RSpec.describe 'Edit a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project', user_id: current_user.id) }
  let(:task) { create(:task, title: 'A test task', project: project) }

  scenario 'user edits a task' do
    visit tasks_path(task)
    click_on 'Edit'

    fill_in 'Title', with: 'A new name for the task'
    fill_in 'Description', with: 'Another description'

    click_button 'Save'

    expect(page).to have_current_path(task_path(task))
    expect(page).to have_content('A new name for the task')
    expect(page).to have_content('Another description')
  end

  context 'when user is not author of the task' do
    let(:project) { create(:project, name: 'A test project') }
    let(:task) { create(:task, title: 'A test task', project: project) }

    scenario 'user tries to edit the task' do
      visit tasks_path(task)
      click_on 'Edit'

      expect(page).to have_current_path(projects_path)
      expect(page).to have_content('not allowed')
    end
  end
end

