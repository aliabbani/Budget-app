require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    @user = User.new(name: 'Ali Abbani')
    @user.categories.new(user_id: @user.id, name: 'Food', icon: 'food-icon') 
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'Food'
    expect(subject).to be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = 'food-icon'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
