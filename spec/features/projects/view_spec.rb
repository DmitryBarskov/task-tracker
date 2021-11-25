require 'rails_helper'

RSpec.describe 'View a project', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, name: 'A test project') }

  scenario 'User views a project' do
    visit project_url(project)

    expect(page).to have_content('A test project')
  end
end
