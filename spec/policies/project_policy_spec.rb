require 'rails_helper'

RSpec.describe 'ProjectPolicy', type: :policy do
  subject(:policy) { ProjectPolicy.new(user, project) }

  let(:project) { Project.new }

  describe '#index?' do
    subject { policy.index? }

    let(:project) { Project }

    context 'when user is not authenticated' do
      let(:user) { nil }

      it { is_expected.to eq(true) }
    end

    context 'when user is authenticated' do
      let(:user) { User.new }

      it { is_expected.to eq(true) }
    end
  end

  describe '#show?' do
    subject { policy.show? }

    context 'when user is not authenticated' do
      let(:user) { nil }

      it { is_expected.to eq(false) }
    end

    context 'when user is authenticated' do
      let(:user) { User.new }

      it { is_expected.to eq(true) }
    end
  end

  describe '#new?'
  describe '#create?'

  describe '#edit?' do
    pending 'implement me'
  end

  describe '#update?' do
    subject { policy.update? }

    let(:user) { User.new(id: 42) }

    context 'when user is not creator of the project' do
      it { is_expected.to eq(false) }
    end

    context 'when user is creator of the project' do
      let(:project) { Project.new(user: user) }

      it { is_expected.to eq(true) }
    end
  end

  describe '#destroy?'
end
