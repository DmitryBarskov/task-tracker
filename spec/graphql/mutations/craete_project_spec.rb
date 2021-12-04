require 'rails_helper'

RSpec.describe Mutations::CreateProject do
  include_context "when time is frozen"

  let(:schema_context) { { current_user: create(:user) } }

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
          createdAt
        }
      }
    GQL
  end

  context 'with valid data' do
    let(:name) { 'Project 1' }
    let(:description) { 'GraphQL API' }
    
    it_behaves_like "graphql request", "creates project" do
      let(:fixture_path) { "graphql/json/create_project.json" }
    end
  end
end
