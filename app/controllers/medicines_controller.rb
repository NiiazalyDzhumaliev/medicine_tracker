class MedicinesController < ApplicationController
  def new
    @medicine = Medicine.new
end

def index
    @medicines = Medicine.where(:group_id => nil).where(:author_id => current_user.id).order("created_at DESC")
end


def create
    @medicine = current_user.medicines.new(medicine_params)
    if @medicine.save
      flash[:success] = "Object successfully created"
      redirect_to medicines_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end

def all_medicines
  @all_medicines = Medicine.where(:author_id => current_user.id).order("created_at DESC")
end

private

def medicine_params
    params.require(:medicine).permit(:name, :amount)
end
end
