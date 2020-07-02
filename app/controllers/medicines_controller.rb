class MedicinesController < ApplicationController
    def new
        @medicine = Medicine.new
    end    
end
