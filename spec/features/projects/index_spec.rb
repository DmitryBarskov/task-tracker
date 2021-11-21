require 'rails_helper'

RSpec.describe 'Visit projects page', type: :feature do
  scenario 'user visits projects page' do
    visit projects_path

    expect(page).to have_content('Projects')
    expect(page).to have_table
    expect(page).to have_content('New Project')
  end
end


