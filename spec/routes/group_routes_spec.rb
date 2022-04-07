require 'rails_helper'

RSpec.describe GroupsController, type: :routing do
  describe 'group routing' do
    it 'groups index route' do
      expect(get: '/groups').to route_to('groups#index')
    end

    it 'new groups routes' do
      expect(get: '/groups/new').to route_to('groups#new')
    end

    it 'create group routes' do
      expect(post: '/groups').to route_to('groups#create')
    end
  end
end
