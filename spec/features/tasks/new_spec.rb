require 'rails_helper'

RSpec.describe 'Create a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project') }

  scenario 'user creates a task' do
    visit projects_path
    click_on 'New Project'

    fill_in 'Name', with: 'A test project'
    fill_in 'Description', with: 'Test description'

    click_button 'Create Project'

    visit tasks_path
    click_on 'New Task'

    fill_in 'Title', with: 'A test task'
    fill_in 'Description', with: 'Test description'
    fill_in 'Deadline', with: 'November 27, 2021 23:59'

    click_button 'Save'

    expect(page).to have_content("Task has been created! ")
  end
end


