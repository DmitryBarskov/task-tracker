require 'rails_helper'

RSpec.describe 'Visit tasks page', type: :feature do
  scenario 'user visits tasks page' do
    visit tasks_path

    expect(page).to have_content('Tasks')
    expect(page).to have_table
    expect(page).to have_content('New Task')
  end
end



