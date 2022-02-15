class EntitiesController < ApplicationController
  def index
    @entities = Entity.all
  end

  def show; end

  def new; end

  def create; end

  def destroy; end
end
