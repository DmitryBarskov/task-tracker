require 'rails_helper'

RSpec.describe 'Create a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project') }

  scenario 'user creates a task incorrectly' do
    visit tasks_path
    click_on 'New Task'

    fill_in 'Title', with: 'A test task'
    fill_in 'Description', with: 'Test description'

    click_button 'Save'

    expect(page).to have_content('2 errors prohibited this model from being saved:')
    expect(page).to have_content('Project must exist')
    expect(page).to have_content("Deadline at can't be blank")
  end
end


