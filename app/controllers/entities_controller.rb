class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.all.order(created_at: :desc)
  end

  def show; end

  def new; end

  def create; end

  def destroy; end
end
