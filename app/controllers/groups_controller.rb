class GroupsController < ApplicationController
  def index
    @groups = Group.all
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
          flash[:success] = 'You have successfully created a category.'
          redirect_to groups_url
        else
          flash.now[:error] = 'Error: Category could not be saved'
          render :new
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
