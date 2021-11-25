require 'rails_helper'

RSpec.describe Mutations::CreateProject do
  subject { MyappSchema.execute(query, context: context).to_h['data']['createProject'] }

  let(:context) { { current_user: create(:user) } }

  let(:query) do
    <<-GQL
      mutation {
        createProject(
          name: "#{name}",
          description: "#{description}"
        ) {
          name
          description
          tasks {
            title
          }
        }
      }
    GQL
  end

  context 'with valid data' do
    let(:name) { 'Project 1' }
    let(:description) { 'GraphQL API' }

    it { is_expected.to eq('name' => 'Project 1', 'description' => 'GraphQL API', 'tasks' => []) }
  end
end
