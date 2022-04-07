require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.new(name: 'Ali Abbani', email: 'ali@mail.com', password: '123456', confirmed_at: Time.now)
    @group = @user.groups.new(user_id: @user.id, name: 'Food', icon: fixture_file_upload('Padget.png'))
    @entity = Entity.new(name: 'Burger', amount: 10, user_id: @user.id, group_id: @group.id)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a group' do
    expect(subject).to respond_to(:group)
  end
end
