require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.new(name: 'Ali Abbani')
    @group = @user.groups.new(user_id: @user.id, name: 'Food', icon: 'food-icon')
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = @group.name
    expect(subject).to be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = @group.icon
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
