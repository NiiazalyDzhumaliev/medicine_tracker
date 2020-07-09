module MedicinesHelper
    def group_occurence(medicine)          
        grouping = Grouping.occurence_in_group(medicine)     
        Group.group_name(grouping).pluck(:name)      
    end

    def icon_occurence(medicine)               
        grouping = Grouping.occurence_in_group(medicine)     
        Group.group_name(grouping).pluck(:icon)        
    end
end