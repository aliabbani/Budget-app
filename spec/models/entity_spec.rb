require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.new(name: 'Ali Abbani', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @group = @user.groups.new(user_id: @user.id, name: 'Food', icon: 'food-icon')
    @entity = Entity.new(name: 'Burger', amount: 10, user_id: @user.id)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  # it 'name should be present 1' do
  #   subject.name = @entity.name
  #   expect(subject).to be_valid
  # end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  # it 'amount should be present 1' do
  #   subject.amount = @entity.amount
  #   expect(subject).to be_valid
  # end

  # it 'is valid with valid attributes' do
  #   expect(subject).to be_valid
  # end
end
