require 'rails_helper'
RSpec.describe 'Edit task', type: :feature do
  include_context 'when user signed in'

  let(:task) { create(:task, title: 'A test task.........', user_id: current_user.id) }

  scenario 'user try to edit a task' do
    visit tasks_path(task)
    click_on 'Edit'
    fill_in 'Description', with: 'Some description'
    click_button 'Save'

    expect(page).to have_current_path(task_url(task))
    expect(page).to have_content('Some description')
  end

  context 'when user is not author of the task' do
    let(:task) { create(:task, title: 'A test task.........', user_id: nil) }

    scenario 'user try to edit the task' do
      visit tasks_path(task)
      click_on 'Edit'
      expect(page).to have_current_path(projects_path)
      expect(page).to have_content('not allowed to edit')
    end
  end
end
