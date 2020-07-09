class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @medicines = @group.medicines
  end

  def index
    @groups = current_user.groups.order('name ASC')
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = 'Object successfully created'
      redirect_to groups_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
