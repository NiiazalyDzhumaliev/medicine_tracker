class Groups::MedicinesController < ApplicationController
  def new
    @medicine = Medicine.new
    @group = Group.find(params[:group_id])
  end

  def index
    @medicines = Medicine.grouped_ones(current_user)
  end

  def create
    @grouping = Grouping.new
    @group = Group.find(params[:group_id])
    @medicine = Medicine.new(medicine_params)
    @medicine.author_id = current_user.id
    @medicine.status = true
    if @medicine.save
      @grouping.medicine_id = @medicine.id
      @grouping.group_id = @group.id
      if @grouping.save
        flash[:success] = 'Object successfully created'
        redirect_to group_path(@group)
      else
        flash[:error] = 'Something went wrong'
        render 'new'
    end
  end
end

  private

  def medicine_params
    params.require(:medicine).permit(:name, :amount, :author_id, :group_id)
  end
end
