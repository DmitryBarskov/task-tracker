require 'rails_helper'

RSpec.describe 'Create a task', type: :feature do
  include_context 'when user signed in'

  before do
    create(:project, name: 'A test project')
  end

  scenario 'user creates a task' do
    visit tasks_path
    click_on 'New Task'

    select "A test project", :from => "Select a project"
    fill_in 'Title', with: 'A test task'
    fill_in 'Description', with: 'Test description'
    fill_in 'Deadline', with: 'November 27, 2021 23:59'

    click_button 'Save'

    expect(page).to have_content("Task has been created!")

    expect(page).to have_content("Title: A test task")
    expect(page).to have_content("Description: Test description")
    expect(page).to have_content("Project: A test project")
    expect(page).to have_content("Deadline: November 27, 2021 23:59")
  end
end


