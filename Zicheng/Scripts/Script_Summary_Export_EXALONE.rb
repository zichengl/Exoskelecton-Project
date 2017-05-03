#Output the summary data in a datavyu spreadsheet for EXALONE assessment, this script will enable you to output frequency, nomalized frequency, total time duration and normalized time duration group by every single behavior variable.
#If you encounter any problems regarding this script, feel free to email me
#Zicheng Liu
#zcliu@udel.edu
require 'Datavyu_API.rb'
begin

#User needs to define the names of the columns

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
    out_file = File.new(dir +"/#{id.cells[0].id}_#{id.cells[0].visitnumber}_EXALONE_summary.txt", "w+")
    
    # printing the headers of the output file
    
    out_file.syswrite("_fk_participant_id" + "\t" +"Initials" + "\t" +"study_phase" + "\t" +"_fk_visit" + "\t" +"Assessment" + "\t" +"Period" + "\t" +"Device_On_Off" + "\t" +"Behavior" + "\t" +"Total_Frequency" + "\t" +"Normalized_Frequency" + "\t" +"Total_Duration" + "\t" +"Normalized_Duration" + "\t" +"\n")
    
    # printing nested cells
    
    # prints all info in id cell
    # tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods
    
    # Must also export the period duration information as records
    
    #Data output for summerizing "EXALONE ON" periods
    
    for idcell in id.cells
        
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                if assessmentcell.deviceonoff == "ON"
                    frequency += 1
                    tot_time +=(assessmentcell.offset-assessmentcell.onset)
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                   
                end
            end
        end
        
        # if a period is missing, the normalized frequency and duration output as "0".
        
        if frequency == 0
            rateF = 0
            rateT = 0
        end
        
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +assessmentcell.assessmentname + "\t" +"EXALONE"  + "\t" +  "ON" + "\t" +"EXALONE"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    end



    #Data output for summerizing "EXALONE OFF" periods
    
    for idcell in id.cells
        
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                if assessmentcell.deviceonoff == "OFF"
                    frequency += 1
                    tot_time +=(assessmentcell.offset-assessmentcell.onset)
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                end
            end
        end
        # if a period is missing, the normalized frequency and duration output as "0".
        if frequency == 0
            rateF = 0
            rateT = 0
        end
        
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +assessmentcell.assessmentname + "\t" +"EXALONE"  + "\t" +  "OFF" + "\t" +"EXALONE"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

    end
    
    # Data output for "ON" "right contact supported"
    
    for idcell in id.cells
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                if assessmentcell.deviceonoff == "ON"
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            for rcontactcell in rcontact.cells
                                if periodcell.contains(rcontactcell)
                                    # count the occurance of each distint behavior
                                if rcontactcell.rcontact == "right contact supported"
                                    frequency += 1
                                    tot_time +=(rcontactcell.offset-rcontactcell.onset)
                                end
                                end
                            end
            end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
        end # end of "if" in traversing assessmentcell
        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
        rateF = format("%0.4f",rate)
        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" +"right contact supported"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    end
    
    # Data output for "On" "right contact suspended"
    
    for idcell in id.cells
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "ON"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rcontactcell in rcontact.cells
                            if periodcell.contains(rcontactcell)
                                # count the occurance of each distint behavior
                                if rcontactcell.rcontact == "right contact suspended"
                                    frequency += 1
                                    tot_time +=(rcontactcell.offset-rcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
            end
        end # end of "if" in traversing assessmentcell
        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
        rateF = format("%0.4f",rate)
        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" +"right contact suspended"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    end
    
    # Data output for "On" "left contact supported"
    
    for idcell in id.cells
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "ON"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lcontactcell in lcontact.cells
                            if periodcell.contains(lcontactcell)
                                # count the occurance of each distint behavior
                                if lcontactcell.lcontact == "left contact supported"
                                    frequency += 1
                                    tot_time +=(lcontactcell.offset-lcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
            end
        end # end of "if" in traversing assessmentcell
        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
        rateF = format("%0.4f",rate)
        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand supported"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    end

    # Data output for  "On" "left contact suspended"

    for idcell in id.cells
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                if assessmentcell.deviceonoff == "ON"
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            for lcontactcell in lcontact.cells
                                if periodcell.contains(lcontactcell)
                                    # count the occurance of each distint behavior
                                    if lcontactcell.lcontact == "left contact suspended"
                                        frequency += 1
                                        tot_time +=(lcontactcell.offset-lcontactcell.onset)
                                    end
                                end
                            end
                        end # end of "for" in traversing periodcell
                    end # end of "if" in traversing periodcell
                end # end of "for" in traversing assessmentcell
            end
        end # end of "if" in traversing assessmentcell
        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
        rateF = format("%0.4f",rate)
        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left contact suspended"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

    end

    # Data output for  "On" "right hand move right"

    for idcell in id.cells
        frequency = 0
        tot_time = 0
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                if assessmentcell.deviceonoff == "ON"
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            for rhormvcell in rhormv.cells
                                if periodcell.contains(rhormvcell)
                                    # count the occurance of each distint behavior
                                    if rhormvcell.rhormv == "right hand move right"
                                        frequency += 1
                                        tot_time +=(rhormvcell.offset-rhormvcell.onset)
                                    end
                                end
                            end
                        end # end of "for" in traversing periodcell
                    end # end of "if" in traversing periodcell
                end # end of "for" in traversing assessmentcell
            end
        end # end of "if" in traversing assessmentcell
        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
        rateF = format("%0.4f",rate)
        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
        out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    end

# Data output for  "On" "right hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move middle"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand move middle"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right hand move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move left"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end
# Data output for  "On" "left hand move right"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move right"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left hand move middle"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move middle"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand move middle"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left hand move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move left"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "right hand at head"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at head"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand at head"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right hand at chest"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at chest"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand at chest"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "right hand at hips"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at hips"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right hand at hips"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left hand at head"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at head"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand at head"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end


# Data output for  "On" "left hand at chest"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at chest"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand at chest"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left hand at hips"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at hips"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left hand at hips"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end


# Data output for  "On" "vis attn"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                   for visattncell in visattn.cells
                        if periodcell.contains(visattncell)
                            # count the occurance of each distint behavior
                            if visattncell.visattn == "vis attn"
                                frequency += 1
                                tot_time +=(visattncell.offset-visattncell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "vis attn"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end


# Data output for  "On" "face attn"

for idcell in id.cells
    frequency = 0
    tot_time = 0
for assessmentcell in assessment.cells
    if assessmentcell.assessmentname == "EXALONE"
    if assessmentcell.deviceonoff == "ON"
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                for visattncell in visattn.cells
                    if periodcell.contains(visattncell)
                        # count the occurance of each distint behavior
                        if visattncell.visattn == "face attn"
                            frequency += 1
                            tot_time +=(visattncell.offset-visattncell.onset)
                        end
                    end
                end
            end # end of "for" in traversing periodcell
        end # end of "if" in traversing periodcell
    end # end of "for" in traversing assessmentcell
    end
end # end of "if" in traversing assessmentcell
rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
rateF = format("%0.4f",rate)
rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "face attn"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right bang"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right bang"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right insert"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right insert"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right insert"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right manipulate"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right manipulate"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right manipulate"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right remove"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right remove"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right remove"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right stack"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right stack"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right stack"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left bang"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "left bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left bang"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left insert"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left insert"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left insert"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    

end

# Data output for  "On" "left manipulate"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                   for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left manipulate"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left manipulate"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "left remove"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left remove"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left remove"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left stack"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left stack"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left stack"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "try mouth"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for mouthreachcell in mouthreach.cells
                        if periodcell.contains(mouthreachcell)
                            # count the occurance of each distint behavior
                            if mouthreachcell.mouthreach == "try mouth"
                                frequency += 1
                                tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "try mouth"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "right arm fling"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for rarmcell in rarm.cells
                        if periodcell.contains(rarmcell)
                            # count the occurance of each distint behavior
                            if rarmcell.rarm == "right arm fling"
                                frequency += 1
                                tot_time +=(rarmcell.offset-rarmcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "right arm fling"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "left arm fling"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for larmcell in larm.cells
                        if periodcell.contains(larmcell)
                            # count the occurance of each distint behavior
                            if larmcell.larm == "left arm fling"
                                frequency += 1
                                tot_time +=(larmcell.offset-larmcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "left arm fling"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "trunk move forward"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                   for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move forward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "trunk move forward"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "trunk move backward"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move backward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "trunk move backward"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "On" "trunk move right"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move right"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "trunk move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")

end

# Data output for  "On" "trunk move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move left"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "ON"   + "\t" + "trunk move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    

end

# Data output for "OFF" "right contact supported"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rcontactcell in rcontact.cells
                            if periodcell.contains(rcontactcell)
                                # count the occurance of each distint behavior
                                if rcontactcell.rcontact == "right contact supported"
                                    frequency += 1
                                    tot_time +=(rcontactcell.offset-rcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" +"right contact supported"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for "OFF" "right contact suspended"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rcontactcell in rcontact.cells
                            if periodcell.contains(rcontactcell)
                                # count the occurance of each distint behavior
                                if rcontactcell.rcontact == "right contact suspended"
                                    frequency += 1
                                    tot_time +=(rcontactcell.offset-rcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" +"right contact suspended"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for "OFF" "left contact supported"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lcontactcell in lcontact.cells
                            if periodcell.contains(lcontactcell)
                                # count the occurance of each distint behavior
                                if lcontactcell.lcontact == "left contact supported"
                                    frequency += 1
                                    tot_time +=(lcontactcell.offset-lcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand supported"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "left contact suspended"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lcontactcell in lcontact.cells
                            if periodcell.contains(lcontactcell)
                                # count the occurance of each distint behavior
                                if lcontactcell.lcontact == "left contact suspended"
                                    frequency += 1
                                    tot_time +=(lcontactcell.offset-lcontactcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left contact suspended"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right hand move right"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rhormvcell in rhormv.cells
                            if periodcell.contains(rhormvcell)
                                # count the occurance of each distint behavior
                                if rhormvcell.rhormv == "right hand move right"
                                    frequency += 1
                                    tot_time +=(rhormvcell.offset-rhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "right hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        frequency = 0
                        tot_time = 0
                        for rhormvcell in rhormv.cells
                            if periodcell.contains(rhormvcell)
                                # count the occurance of each distint behavior
                                if rhormvcell.rhormv == "right hand move middle"
                                    frequency += 1
                                    tot_time +=(rhormvcell.offset-rhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand move middle"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right hand move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rhormvcell in rhormv.cells
                            if periodcell.contains(rhormvcell)
                                # count the occurance of each distint behavior
                                if rhormvcell.rhormv == "right hand move left"
                                    frequency += 1
                                    tot_time +=(rhormvcell.offset-rhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end
# Data output for  "OFF" "left hand move right"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lhormvcell in lhormv.cells
                            if periodcell.contains(lhormvcell)
                                # count the occurance of each distint behavior
                                if lhormvcell.lhormv == "left hand move right"
                                    frequency += 1
                                    tot_time +=(lhormvcell.offset-lhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left hand move middle"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lhormvcell in lhormv.cells
                            if periodcell.contains(lhormvcell)
                                # count the occurance of each distint behavior
                                if lhormvcell.lhormv == "left hand move middle"
                                    frequency += 1
                                    tot_time +=(lhormvcell.offset-lhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand move middle"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left hand move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lhormvcell in lhormv.cells
                            if periodcell.contains(lhormvcell)
                                # count the occurance of each distint behavior
                                if lhormvcell.lhormv == "left hand move left"
                                    frequency += 1
                                    tot_time +=(lhormvcell.offset-lhormvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "right hand at head"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rvertmvcell in rvertmv.cells
                            if periodcell.contains(rvertmvcell)
                                # count the occurance of each distint behavior
                                if rvertmvcell.rvertmv == "right hand at head"
                                    frequency += 1
                                    tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand at head"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right hand at chest"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rvertmvcell in rvertmv.cells
                            if periodcell.contains(rvertmvcell)
                                # count the occurance of each distint behavior
                                if rvertmvcell.rvertmv == "right hand at chest"
                                    frequency += 1
                                    tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand at chest"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "right hand at hips"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rvertmvcell in rvertmv.cells
                            if periodcell.contains(rvertmvcell)
                                # count the occurance of each distint behavior
                                if rvertmvcell.rvertmv == "right hand at hips"
                                    frequency += 1
                                    tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right hand at hips"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left hand at head"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lvertmvcell in lvertmv.cells
                            if periodcell.contains(lvertmvcell)
                                # count the occurance of each distint behavior
                                if lvertmvcell.lvertmv == "left hand at head"
                                    frequency += 1
                                    tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand at head"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end


# Data output for  "OFF" "left hand at chest"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lvertmvcell in lvertmv.cells
                            if periodcell.contains(lvertmvcell)
                                # count the occurance of each distint behavior
                                if lvertmvcell.lvertmv == "left hand at chest"
                                    frequency += 1
                                    tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand at chest"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left hand at hips"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for lvertmvcell in lvertmv.cells
                            if periodcell.contains(lvertmvcell)
                                # count the occurance of each distint behavior
                                if lvertmvcell.lvertmv == "left hand at hips"
                                    frequency += 1
                                    tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left hand at hips"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end


# Data output for  "OFF" "vis attn"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for visattncell in visattn.cells
                            if periodcell.contains(visattncell)
                                # count the occurance of each distint behavior
                                if visattncell.visattn == "vis attn"
                                    frequency += 1
                                    tot_time +=(visattncell.offset-visattncell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end


# Data output for  "OFF" "face attn"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for visattncell in visattn.cells
                            if periodcell.contains(visattncell)
                                # count the occurance of each distint behavior
                                if visattncell.visattn == "face attn"
                                    frequency += 1
                                    tot_time +=(visattncell.offset-visattncell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "face attn"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right bang"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "right bang"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right bang"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right insert"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "right insert"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right insert"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right manipulate"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "right manipulate"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right manipulate"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right remove"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "right remove"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right remove"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right stack"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "right stack"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right stack"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left bang"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rtoyintcell in rtoyint.cells
                            if periodcell.contains(rtoyintcell)
                                # count the occurance of each distint behavior
                                if rtoyintcell.rtoyint == "left bang"
                                    frequency += 1
                                    tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left bang"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left insert"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for ltoyintcell in ltoyint.cells
                            if periodcell.contains(ltoyintcell)
                                # count the occurance of each distint behavior
                                if ltoyintcell.ltoyint == "left insert"
                                    frequency += 1
                                    tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left insert"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
    
end

# Data output for  "OFF" "left manipulate"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for ltoyintcell in ltoyint.cells
                            if periodcell.contains(ltoyintcell)
                                # count the occurance of each distint behavior
                                if ltoyintcell.ltoyint == "left manipulate"
                                    frequency += 1
                                    tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left manipulate"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "left remove"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for ltoyintcell in ltoyint.cells
                            if periodcell.contains(ltoyintcell)
                                # count the occurance of each distint behavior
                                if ltoyintcell.ltoyint == "left remove"
                                    frequency += 1
                                    tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left remove"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left stack"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for ltoyintcell in ltoyint.cells
                            if periodcell.contains(ltoyintcell)
                                # count the occurance of each distint behavior
                                if ltoyintcell.ltoyint == "left stack"
                                    frequency += 1
                                    tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left stack"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "try mouth"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for mouthreachcell in mouthreach.cells
                            if periodcell.contains(mouthreachcell)
                                # count the occurance of each distint behavior
                                if mouthreachcell.mouthreach == "try mouth"
                                    frequency += 1
                                    tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "right arm fling"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for rarmcell in rarm.cells
                            if periodcell.contains(rarmcell)
                                # count the occurance of each distint behavior
                                if rarmcell.rarm == "right arm fling"
                                    frequency += 1
                                    tot_time +=(rarmcell.offset-rarmcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "right arm fling"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "left arm fling"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for larmcell in larm.cells
                            if periodcell.contains(larmcell)
                                # count the occurance of each distint behavior
                                if larmcell.larm == "left arm fling"
                                    frequency += 1
                                    tot_time +=(larmcell.offset-larmcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "left arm fling"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "trunk move forward"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for trunkcell in trunk.cells
                            if periodcell.contains(trunkcell)
                                # count the occurance of each distint behavior
                                if trunkcell.trunk == "trunk move forward"
                                    frequency += 1
                                    tot_time +=(trunkcell.offset-trunkcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "trunk move forward"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "trunk move backward"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for trunkcell in trunk.cells
                            if periodcell.contains(trunkcell)
                                # count the occurance of each distint behavior
                                if trunkcell.trunk == "trunk move backward"
                                    frequency += 1
                                    tot_time +=(trunkcell.offset-trunkcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "trunk move backward"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
end

# Data output for  "OFF" "trunk move right"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for trunkcell in trunk.cells
                            if periodcell.contains(trunkcell)
                                # count the occurance of each distint behavior
                                if trunkcell.trunk == "trunk move right"
                                    frequency += 1
                                    tot_time +=(trunkcell.offset-trunkcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "trunk move right"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
end

# Data output for  "OFF" "trunk move left"

for idcell in id.cells
    frequency = 0
    tot_time = 0
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "EXALONE"
            if assessmentcell.deviceonoff == "OFF"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        for trunkcell in trunk.cells
                            if periodcell.contains(trunkcell)
                                # count the occurance of each distint behavior
                                if trunkcell.trunk == "trunk move left"
                                    frequency += 1
                                    tot_time +=(trunkcell.offset-trunkcell.onset)
                                end
                            end
                        end
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end
    end # end of "if" in traversing assessmentcell
    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
    rateF = format("%0.4f",rate)
    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
    out_file.syswrite(idcell.id  + "\t" +idcell.initials  + "\t" +idcell.studyphase  + "\t" +idcell.visitnumber  + "\t" +  "EXALONE"  + "\t" + "EXALONE"  + "\t" + "OFF"   + "\t" + "trunk move left"  + "\t" +"#{frequency}"  + "\t" +"#{rateF}"  + "\t" +"#{tot_time}"  + "\t" +"#{rateT}"  + "\t" +"\n")
    
    
end

    #                       ************************************************

    # Copy and paste to add variables as needed to export all of the variables' data with one script

    #                       ************************************************

end

