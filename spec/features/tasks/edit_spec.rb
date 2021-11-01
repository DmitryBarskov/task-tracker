require 'rails_helper'

RSpec.describe 'Edit a task', type: :feature do
  include_context 'when user signed in'

  let(:task) { create(:task, title: 'A test task!!!!!!!!!', user_id: current_user.id) }

  scenario 'user edit a task' do
    visit tasks_path(task)
    click_on 'Edit'
    fill_in 'Description', with: 'Another description'
    click_button 'Save'

    expect(page).to have_current_path(task_url(task))
    expect(page).to have_content('Another description')
  end

  context 'when user is not author of the task' do
    let(:task) { create(:task, title: 'A test task!!!!!!!!!', user_id: current_user.id + 1) }
    
    scenario 'user tries to edit the task' do
      visit tasks_path(task)
      click_on 'Edit'
      expect(page).to have_current_path(projects_path)
      expect(page).to have_content('not allowed')
    end
  end
end
