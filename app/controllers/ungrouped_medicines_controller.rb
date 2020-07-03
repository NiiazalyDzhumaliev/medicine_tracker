class UngroupedMedicinesController < ApplicationController
    def new
        @ungrouped_medicine = UngroupedMedicine.new
    end

    def index
        @ungrouped_medicines = UngroupedMedicine.where(:user_id => current_user.id).order("created_at DESC")
    end


    def create
        @ungrouped_medicine = current_user.ungrouped_medicines.new(ungrouped_medicine_params)
        if @ungrouped_medicine.save
          flash[:success] = "Object successfully created"
          redirect_to ungrouped_medicines_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def ungrouped_medicine_params
        params.require(:ungrouped_medicine).permit(:name, :amount)
    end
    
end
