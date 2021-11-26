require 'rails_helper'

RSpec.describe 'Create a project', type: :feature do
  include_context 'when user signed in'

  scenario 'user creates a project' do
    visit projects_path
    click_on 'New Project'

    fill_in 'Name', with: 'A test project'
    fill_in 'Description', with: 'Test description'

    click_button 'Create Project'

    expect(page).to have_content('Project was successfully created.')
    expect(page).to have_content('A test project')
    expect(page).to have_content('Test description')
  end
end

