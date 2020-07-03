class MedicinesController < ApplicationController
    def new
        @medicine = Medicine.new
        @group = Group.find(params[:group_id])
    end
    
    def index
      @medicines = Medicine.where(:author_id => current_user.id).order("created_at DESC")
    end
    

    def create
        @group = Group.find(params[:group_id])
        @medicine = @group.medicines.new(medicine_params)
        @medicine.author_id = current_user.id
        if @medicine.save
          flash[:success] = "Object successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private

    def medicine_params
        params.require(:medicine).permit(:name, :amount, :author_id, :group_id)
    end
    
end
