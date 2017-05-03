#Output the raw data in a datavyu spreadsheet for EXALONE assessment, this script will enable you to output the raw recorded data in every single cell of behavior to a text file.
#If you encounter any problems regarding this script, feel free to email me
#Zicheng Liu
#zcliu@udel.edu
require 'Datavyu_API.rb'
begin

#User needs to define the names of columns

id = getVariable("ID")
assessment = getVariable("Assessment")
period = getVariable("Period")
rcontact = getVariable("RContact")
lcontact = getVariable("LContact")
rhormv = getVariable("RHorMv")
lhormv = getVariable("LHorMv")
rvertmv = getVariable("RVertMv")
lvertmv = getVariable("LVertMv")
visattn = getVariable("VisAttn")
rtoyint = getVariable("RToyInt")
ltoyint = getVariable("LToyInt")
mouthreach = getVariable("MouthReach")
rarm = getVariable("RArm")
larm = getVariable("LArm")
trunk = getVariable("Trunk")

# Assign location of output file.  This file will save with specified name on Desktop.

dir = File.expand_path("~/Desktop")
out_file = File.new(dir + "/#{id.cells[0].id}_#{id.cells[0].visitnumber}_EXALONE_raw.txt", "w+")

# printing the headers of the output file

out_file.syswrite("_fk_participant_id"  + "\t" + "Initials"  + "\t" + "study_phase"  + "\t" + "_fk_visit"  + "\t" + "Assessment"  + "\t" + "Period"  + "\t" + "Device_On_Off"  + "\t" + "Behavior"  + "\t" + "Start Behavior"  + "\t" + "End Behavior"  + "\t" + "Total Duration"  + "\t" + "Descriptor 1"  + "\t" + "Descriptor 2"  + "\t" + "Descriptor 3"  + "\t" + "Descriptor 4"  + "\t" + "Descriptor 5"   + "\t" + "\n")


# printing nested cells

# prints all info in id cell
# tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods

# Data output for 1st variable column rcontact

# Must also export the period duration information as records

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    
                    # writes data in output file
                    
                    out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber    + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.periodname + " " + periodcell.hand  + "\t" + assessmentcell.deviceonoff     + "\t" + assessmentcell.assessmentname     + "\t" + periodcell.onset.to_s    + "\t" + periodcell.offset.to_s   + "\t"  + (periodcell.offset - periodcell.onset).to_s + "\n")
                    
                end
            end
        end
    end
end




for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for rcontactcell in rcontact.cells
                    if periodcell.contains(rcontactcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase    + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname   + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + rcontactcell.rcontact   + "\t" + rcontactcell.onset.to_s    + "\t" + rcontactcell.offset.to_s   + "\t" + (rcontactcell.offset - rcontactcell.onset).to_s   + "\t" +  "\n")
                            
                    end
                end
            end
        end
    end
end

# Data output for 2nd variable column lcontact

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for lcontactcell in lcontact.cells
                    if periodcell.contains(lcontactcell)
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + lcontactcell.lcontact      + "\t" + lcontactcell.onset.to_s      + "\t" + lcontactcell.offset.to_s   + "\t" + (lcontactcell.offset - lcontactcell.onset).to_s   + "\t" +  "\n")
                            
                    end
                end
            end
        end
    end
end


# Data output for 3rd variable column rhormv

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for rhormvcell in rhormv.cells
                    if periodcell.contains(rhormvcell)
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + rhormvcell.rhormv     + "\t" + rhormvcell.onset.to_s    + "\t" + rhormvcell.offset.to_s   + "\t" + (rhormvcell.offset - rhormvcell.onset).to_s   + "\t" +  "\n")
                            
                    end
                end
            end
        end
    end
end


# Data output for 4th variable column lhormv

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for lhormvcell in lhormv.cells
                    if periodcell.contains(lhormvcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + lhormvcell.lhormv     + "\t" + lhormvcell.onset.to_s      + "\t" + lhormvcell.offset.to_s   + "\t" + (lhormvcell.offset - lhormvcell.onset).to_s   + "\t" +  "\n")
                            
                    end
                end
            end
        end
    end
end


# Data output for 5th variable column rvertmv

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for rvertmvcell in rvertmv.cells
                    if periodcell.contains(rvertmvcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + rvertmvcell.rvertmv      + "\t" + rvertmvcell.onset.to_s     + "\t" + rvertmvcell.offset.to_s   + "\t" + (rvertmvcell.offset - rvertmvcell.onset).to_s   + "\t" +  "\n")
                    end
                end
            end
        end
    end
end


# Data output for 6th variable column lvertmv

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for lvertmvcell in lvertmv.cells
                    if periodcell.contains(lvertmvcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + lvertmvcell.lvertmv     + "\t" + lvertmvcell.onset.to_s    + "\t" + lvertmvcell.offset.to_s    + "\t" + (lvertmvcell.offset - lvertmvcell.onset).to_s   + "\t" +  "\n")
        
                    end
                end
            end
        end
    end
end


# Data output for 7th variable column visattn

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for visattncell in visattn.cells
                    if periodcell.contains(visattncell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + visattncell.visattn      + "\t" + visattncell.onset.to_s      + "\t" + visattncell.offset.to_s   + "\t" + (visattncell.offset - visattncell.onset).to_s   + "\t" +  "\n")
                    end
                end
            end
        end
    end
end


# Data output for 8th variable column rtoyint

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for rtoyintcell in rtoyint.cells
                    if periodcell.contains(rtoyintcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + rtoyintcell.rtoyint      + "\t" + rtoyintcell.onset.to_s      + "\t" + rtoyintcell.offset.to_s   + "\t" + (rtoyintcell.offset - rtoyintcell.onset).to_s   + "\t" +  "\n")
                    end
                end
            end
        end
    end
end

# Data output for 9th variable column ltoyint

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for ltoyintcell in ltoyint.cells
                    if periodcell.contains(ltoyintcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + ltoyintcell.ltoyint      + "\t" + ltoyintcell.onset.to_s      + "\t" + ltoyintcell.offset.to_s   + "\t" + (ltoyintcell.offset - ltoyintcell.onset).to_s   + "\t" +  "\n")
                            
                        
                    end
                end
            end
        end
    end
end

# Data output for 10th variable column mouthreach

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for mouthreachcell in mouthreach.cells
                    if periodcell.contains(mouthreachcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber    + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + mouthreachcell.mouthreach     + "\t" + mouthreachcell.onset.to_s    + "\t" + mouthreachcell.offset.to_s   + "\t" + (mouthreachcell.offset - mouthreachcell.onset).to_s   + "\t" +  "\n")
                            
                        
                    end
                end
            end
        end
    end
end

# Data output for 11th variable column rarm

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for rarmcell in rarm.cells
                    if periodcell.contains(rarmcell)
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + rarmcell.rarm      + "\t" + rarmcell.onset.to_s      + "\t" + rarmcell.offset.to_s   + "\t" + (rarmcell.offset - rarmcell.onset).to_s   + "\t" +  "\n")
                            
                        
                    end
                end
            end
        end
    end
end

# Data output for 12th variable column larm

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for larmcell in larm.cells
                    if periodcell.contains(larmcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + larmcell.larm      + "\t" + larmcell.onset.to_s      + "\t" + larmcell.offset.to_s   + "\t" + (larmcell.offset - larmcell.onset).to_s   + "\t" +  "\n")
                            
                        
                    end
                end
            end
        end
    end
end

# Data output for 13th variable column trunk

for idcell in id.cells
    for assessmentcell in assessment.cells
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
            for trunkcell in trunk.cells
                if periodcell.contains(trunkcell)
                            
                            # writes data in output file
                            
                            out_file.syswrite(idcell.id      + "\t" + idcell.initials      + "\t" + idcell.studyphase      + "\t" + idcell.visitnumber      + "\t" + assessmentcell.assessmentname      + "\t" + periodcell.periodname      + "\t" + assessmentcell.deviceonoff      + "\t" + trunkcell.trunk      + "\t" + trunkcell.onset.to_s     + "\t" + trunkcell.offset.to_s   + "\t" + (trunkcell.offset - trunkcell.onset).to_s   + "\t" +  "\n")
                        
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

