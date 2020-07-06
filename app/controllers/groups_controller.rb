class GroupsController < ApplicationController

    def new
        @group = Group.new
    end

    def show
        @group = Group.find(params[:id])
        @medicines = Medicine.where(:group_id => params[:id]).where(:author_id => current_user.id).order("created_at DESC").includes(:group)
    end
    

    def index
        @groups = Group.where(:user_id => current_user.id).order("name ASC")
    end

    def create
        @group = current_user.groups.new(group_params)
        if @group.save
          flash[:success] = "Object successfully created"
          redirect_to groups_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :icon)
    end
        
end
