class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = @group.entities.all.order(created_at: :desc)
  end

  def show; end

  def new
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.create!(name: entity_params[:name], amount: entity_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)

    respond_to do |format|
      format.html do
        if @entity.save
          flash[:success] = 'You have successfully created a transaction.'
          redirect_to group_entities_path(@group.id)
        else
          flash.now[:error] = 'Error: Transaction could not be saved'
          render :new
        end
      end
    end
  end

  def destroy; end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
