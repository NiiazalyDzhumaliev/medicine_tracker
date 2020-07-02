class MedicinesController < ApplicationController
    def new
        @medicine = Medicine.new
    end

    def create
        @medicine = Medicine.new(medicine_params)
        @medicine.author_id = current_user.id
        @medicine.group_id = 1
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
        params.require(:medicine).permit(:name, :amount, :author_id)
    end
    
end
