class MedicinesController < ApplicationController
    def new
        @medicine = Medicine.new
    end

    def create
        @medicine = Medicine.new(comment_params)
        @medicine.group_id = params[:group_id]
        if @medicine.save
          flash[:success] = "Object successfully created"
          redirect_to group_path(@medicine.group)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private

    def medicine_params
        params.require(:medicine).permit(:name, :amount)
    end
    
end
