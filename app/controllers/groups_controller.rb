class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
    @groups = current_user.groups.all.includes(icon_attachment: :blob)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_url, notice: 'You have successfully created a category.'
        else
          render :new, alert: 'Error: Category could not be saved'
        end
      end
    end
  end

  def destroy; end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
