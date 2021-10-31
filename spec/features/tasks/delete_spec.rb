require 'rails_helper'

RSpec.describe 'Delete a task', type: :feature do
  include_context 'when user signed in'

  let(:project) { create(:project, user: current_user) }
  let(:task) { create(:task, project: project, title: 'A test task!!!!!!!!!', user_id: current_user) }

  scenario 'user try to delete a task' do
    visit tasks_path(task)

    save_and_open_page

    click_on 'Destroy'

    expect(page).to have_no_content('A test task!!!!!!!!!')
  end

  context 'when user is not author of the task' do
    let(:project) { create(:project, user: current_user) }
    let(:task) { create(:task, project: project, title: 'A test task!!!!!!!!!', user_id: current_user) }
    
    scenario 'user tries to destroy the task' do
      visit tasks_path(task)

      expect(page).to have_no_current_path(projects_path)
      expect(page).to have_no_content('not allowed')
    end
  end
end