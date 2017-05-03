#Output the raw data in a datavyu spreadsheet for RCHLOC assessment, this script will enable you to output the raw recorded data in every single cell of behavior output to a text file.
#If you encounter any problems regarding this script, feel free to email me
#Zicheng Liu
#zcliu@udel.edu
require 'Datavyu_API.rb'
begin

#User needs to define the names of columns

id = getVariable("ID")
assessment = getVariable("Assessment")
period = getVariable("Period")
righthand = getVariable("RightHand")
lefthand= getVariable("LeftHand")
visattn = getVariable("VisAttn")
mouthreach = getVariable("MouthReach")

#Assign location of output file.  This file will save with specified name on Desktop.

dir = File.expand_path("~/Desktop")
out_file = File.new(dir +"/#{id.cells[0].id}_#{id.cells[0].visitnumber}_RCHLOC_raw.txt", "w+")

# printing the headers of the output file

out_file.syswrite("_fk_participant_id"  + "\t" + "Initials"  + "\t" + "study_phase"  + "\t" + "_fk_visit"  + "\t" + "Assessment" + "\t" + "Period" + "\t" + "Device_On_Off" + "\t" + "Behavior" + "\t" + "Start Behavior"  + "\t" + "End Behavior" + "\t" + "Total_Duration" + "\t" + "Descriptor 1" + "\t" + "Descriptor 2" + "\t" + "Descriptor 3" + "\t" + "Descriptor 4" + "\t" + "Descriptor 5" + "\t" + "\n")


# printing nested cells

# prints all info in id cell
# tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods

# Data output for "ON" period cells

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                
                        # writes data in output file
                        
                        out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + "RCHLOC"  + "\t" + periodcell.onset.to_s    + "\t" + periodcell.offset.to_s  + "\t" + (periodcell.offset - periodcell.onset).to_s + "\t" + "\n")
                        
                        
            
                end
            end
        end
        end
    end
end

# Data output for "OFF" period cells

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    
                    # writes data in output file
                    
                    out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + "RCHLOC"  + "\t" + periodcell.onset.to_s    + "\t" + periodcell.offset.to_s  + "\t" + (periodcell.offset - periodcell.onset).to_s + "\t" + "\n")
                    
                    
                    
                end
            end
        end
        end
    end
end

# Data output for 1st variable column righthand

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for righthandcell in righthand.cells
                    if periodcell.contains(righthandcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + righthandcell.righthand  + "\t" + righthandcell.onset.to_s    + "\t" + righthandcell.offset.to_s  + "\t" + (righthandcell.offset - righthandcell.onset).to_s + "\t" + righthandcell.ventraldorsal  + "\t" + righthandcell.openat  + "\t" + righthandcell.openever  + "\t" + "\n")
                            
    
                    end
                end
            end
        end
    end
end

# Data output for 2nd variable column lefthand

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for lefthandcell in lefthand.cells
                    if periodcell.contains(lefthandcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname  + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + lefthandcell.lefthand     + "\t" + lefthandcell.onset.to_s      + "\t" + lefthandcell.offset.to_s  + "\t" + (lefthandcell.offset - lefthandcell.onset).to_s + "\t" +  lefthandcell.ventraldorsal  + "\t" + lefthandcell.openat  + "\t" + lefthandcell.openever  + "\t" + "\n")
                            
                    end
                end
            end
        end
    end
end

# Data output for 3rd variable column visattn

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for visattncell in visattn.cells
                    if periodcell.contains(visattncell)
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname  + " " +periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + visattncell.visattn     + "\t" + visattncell.onset.to_s      + "\t" + visattncell.offset.to_s + "\t" + (visattncell.offset - visattncell.onset).to_s + "\t" + "\n")
                            
                    end
                end
            end
        end
    end
end



# Data output for 4th variable column mouthreach

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for mouthreachcell in mouthreach.cells
                    if periodcell.contains(mouthreachcell)
                
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber    + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + mouthreachcell.mouthreach    + "\t" + mouthreachcell.onset.to_s    + "\t" + mouthreachcell.offset.to_s   + "\t" + (mouthreachcell.offset - mouthreachcell.onset).to_s + "\t" + "\n")
                            
                    end
                end
            end
        end
    end
end



#                       ************************************************

# Copy and paste to add variables as needed to export all of the variables' data with one script

#                       ************************************************





# Final end command follows

end

