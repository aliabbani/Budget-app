require 'rails_helper'

RSpec.describe EntitiesController, type: :routing do
  describe 'entity routing' do
    it 'entities index route' do
      expect(get: 'groups/1/entities').to route_to('entities#index', group_id: '1')
    end

    it 'new entities routes' do
      expect(get: 'groups/1/entities/new').to route_to('entities#new', group_id: '1')
    end

    it 'create entities route' do
      expect(post: 'groups/1/entities').to route_to('entities#create', group_id: '1')
    end
  end
end
