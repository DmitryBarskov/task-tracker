require 'rails_helper'

RSpec.describe 'TaskPolicy', type: :policy do
  subject(:policy) { TaskPolicy.new(user, task) }

  describe '#index?' do
    subject { policy.index? }

    let(:task) { Task }

    context 'when user is authenticated' do
      let(:user) { User.new }

      it { is_expected.to eq(true) }

      # let(:index) { policy.index? }

      # it do
        # is_expected = expect(index)
        # is_expected.to eq(true)
      # end
    end

    context 'when user is not authenticated' do
      let(:user) { nil }

      it { is_expected.to eq(false) }
    end
  end

  describe '#create?' do
    subject { policy.create? }

    let(:project) { Project.new(id: 42, user: creator) }
    let(:task) { Task.new(project: project) }
    let(:creator) { User.new(id: 43) }

    context 'when user is creator of the project' do
      let(:user) { creator }
    
      it { is_expected.to eq(true) }
    end

    context 'when user is not creator of the project' do
      let(:user) { User.new(id: 44) }
    
      it { is_expected.to eq(false) }
    end
  end
end
