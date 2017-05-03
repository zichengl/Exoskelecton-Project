require 'Datavyu_API.rb'
begin
    
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
    
    # assign location of output file.  This file will save with specified name on Desktop.
    
    dir = File.expand_path("~/Desktop")
    for idcell in id.cells
        ID = idcell.id
        INITIALS = idcell.initials
    end
    
    out_file = File.new(dir +"/#{ID}_#{INITIALS}_EXALONE_summary.txt", "w+")
    
    # printing the headers of the output file
    
    out_file.syswrite("_fk_participant_id".rjust(18)+ "\t" +"Initials".rjust(12)+ "\t" +"study_phase".rjust(15)+ "\t" +"_fk_visit".rjust(13)+ "\t" +"Assessment".rjust(14)+ "\t" +"Period".rjust(10)+ "\t" +"Device_On_Off".rjust(16)+ "\t" +"Behavior".rjust(27)+ "\t" +"Total_Frequency".rjust(20)+ "\t" +"Normalized_Frequency".rjust(24)+ "\t" +"Total_Duration".rjust(19)+ "\t" +"Normalized_Duration".rjust(23)+ "\t" +"\n")
    
    # printing nested cells
    
    # prints all info in id cell
    # tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods
    
    # Must also export the period duration information as records
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXALONE"
                
                frequency = 0
                
                tot_time = 0
                    frequency += 1
                    tot_time +=(assessmentcell.offset-assessmentcell.onset)

                for periodcell in period.cells
                    if periodcell.onset >= assessmentcell.onset and periodcell.offset <= assessmentcell.offset
                        if assessmentcell.onset >= idcell.onset and assessmentcell.offset <= idcell.offset
                            rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                            rateF = format("%.2f",rate)
                            rateT = format("%.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)

                            out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14)+ "\t" +periodcell.periodname.rjust(10) + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"EXALONE".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                            
                        end
                    end
                end
            end
        end
    end
    
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "EXSURFACE"
                
                frequency = 0
                
                tot_time = 0
                frequency += 1
                tot_time +=(assessmentcell.offset-assessmentcell.onset)
                
                for periodcell in period.cells
                    if periodcell.onset >= assessmentcell.onset and periodcell.offset <= assessmentcell.offset
                        if assessmentcell.onset >= idcell.onset and assessmentcell.offset <= idcell.offset
                            
                            
                            rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                            rateF = format("%.2f",rate)
                            rateT = format("%.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                            
                            out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14)+ "\t" +periodcell.periodname.rjust(10) + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"EXSURFACE".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                            
                        end
                    end
                end
            end
        end
    end
    
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "FLOOR"
                
                frequency = 0
                
                tot_time = 0
                frequency += 1
                tot_time +=(assessmentcell.offset-assessmentcell.onset)
                
                for periodcell in period.cells
                    if periodcell.onset >= assessmentcell.onset and periodcell.offset <= assessmentcell.offset
                        if assessmentcell.onset >= idcell.onset and assessmentcell.offset <= idcell.offset
                            
                            
                            rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                            rateF = format("%.2f",rate)
                            rateT = format("%.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                            
                            out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14)+ "\t" +periodcell.periodname.rjust(10) + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"FLOOR".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                            
                        end
                    end
                end
            end
        end
    end

    
    
    
    # Data output for "ON" "right contact supported"
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                frequency = 0
                tot_time = 0
                for rcontactcell in rcontact.cells
                if periodcell.contains(rcontactcell)
                            # count the occurance of each distint behavior
                        if rcontactcell.rcontact == "right contact supported"
                            frequency += 1
                            tot_time +=(rcontactcell.offset-rcontactcell.onset)
                        end
                end
                end
            rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
            rateF = format("%0.2f",rate)
            rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
            out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right contact supported".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
            end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
        end # end of "if" in traversing assessmentcell
    end
    
    # Data output for "On" "right contact suspended"
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.deviceonoff == "ON"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        frequency = 0
                        tot_time = 0
                        for rcontactcell in rcontact.cells
                            if periodcell.contains(rcontactcell)
                                # count the occurance of each distint behavior
                                if rcontactcell.rcontact == "right contact suspended"
                                    frequency += 1
                                    tot_time +=(rcontactcell.offset-rcontactcell.onset)
                                end
                            end
                        end
                        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                        rateF = format("%0.2f",rate)
                        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                        out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right contact suspended".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end # end of "if" in traversing assessmentcell
    end
    
    # Data output for "On" "left contact supported"
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.deviceonoff == "ON"
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        frequency = 0
                        tot_time = 0
                        for lcontactcell in lcontact.cells
                            if periodcell.contains(lcontactcell)
                                # count the occurance of each distint behavior
                                if lcontactcell.lcontact == "left contact supported"
                                    frequency += 1
                                    tot_time +=(lcontactcell.offset-lcontactcell.onset)
                                end
                            end
                        end
                        rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                        rateF = format("%0.2f",rate)
                        rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                        out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left contact supported".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                    end # end of "for" in traversing periodcell
                end # end of "if" in traversing periodcell
            end # end of "for" in traversing assessmentcell
        end # end of "if" in traversing assessmentcell
    end

# Data output for  "On" "left contact suspended"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lcontactcell in lcontact.cells
                        if periodcell.contains(lcontactcell)
                            # count the occurance of each distint behavior
                            if lcontactcell.lcontact == "left contact suspended"
                                frequency += 1
                                tot_time +=(lcontactcell.offset-lcontactcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left contact suspended".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move right"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
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
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move middle".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move left"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end
# Data output for  "On" "left hand move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move right"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move middle"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move middle".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left hand move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move left"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand at head"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at head"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at head".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand at chest"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at chest"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at chest".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right hand at hips"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at hips"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at hips".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left hand at head"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at head"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at head".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "On" "left hand at chest"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at chest"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at chest".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left hand at hips"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at hips"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at hips".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "On" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for visattncell in visattn.cells
                        if periodcell.contains(visattncell)
                            # count the occurance of each distint behavior
                            if visattncell.visattn == "vis attn"
                                frequency += 1
                                tot_time +=(visattncell.offset-visattncell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"vis attn".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "On" "face attn"

for idcell in id.cells
for assessmentcell in assessment.cells
    if assessmentcell.deviceonoff == "ON"
        for periodcell in period.cells
            if assessmentcell.contains(periodcell)
                frequency = 0
                tot_time = 0
                for visattncell in visattn.cells
                    if periodcell.contains(visattncell)
                        # count the occurance of each distint behavior
                        if visattncell.visattn == "face attn"
                            frequency += 1
                            tot_time +=(visattncell.offset-visattncell.onset)
                        end
                    end
                end
                rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                rateF = format("%0.2f",rate)
                rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"face attn".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
            end # end of "for" in traversing periodcell
        end # end of "if" in traversing periodcell
    end # end of "for" in traversing assessmentcell
end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right bang"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right bang".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right insert"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right insert"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right insert".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right manipulate"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right manipulate"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right manipulate".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right remove"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right remove"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right remove".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right stack"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right stack"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right stack".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left bang"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "left bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left bang".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left insert"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left insert"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left insert".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left manipulate"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left manipulate"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left manipulate".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left remove"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left remove"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left remove".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left stack"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left stack"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left stack".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for mouthreachcell in mouthreach.cells
                        if periodcell.contains(mouthreachcell)
                            # count the occurance of each distint behavior
                            if mouthreachcell.mouthreach == "try mouth"
                                frequency += 1
                                tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"try mouth".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "right arm fling"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rarmcell in rarm.cells
                        if periodcell.contains(rarmcell)
                            # count the occurance of each distint behavior
                            if rarmcell.rarm == "right arm fling"
                                frequency += 1
                                tot_time +=(rarmcell.offset-rarmcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right arm fling".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "left arm fling"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for larmcell in larm.cells
                        if periodcell.contains(larmcell)
                            # count the occurance of each distint behavior
                            if larmcell.larm == "left arm fling"
                                frequency += 1
                                tot_time +=(larmcell.offset-larmcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left arm fling".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end
# Data output for  "On" "trunk move forward"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move forward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move forward".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "trunk move backward"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move backward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move backward".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "trunk move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move right"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "On" "trunk move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "ON"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move left"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for "OFF" "right contact supported"


for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rcontactcell in rcontact.cells
                        if periodcell.contains(rcontactcell)
                            # count the occurance of each distint behavior
                            if rcontactcell.rcontact == "right contact supported"
                                frequency += 1
                                tot_time +=(rcontactcell.offset-rcontactcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right contact supported".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for "OFF" "right contact suspended"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rcontactcell in rcontact.cells
                        if periodcell.contains(rcontactcell)
                            # count the occurance of each distint behavior
                            if rcontactcell.rcontact == "right contact suspended"
                                frequency += 1
                                tot_time +=(rcontactcell.offset-rcontactcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right contact suspended".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for "OFF" "left contact supported"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lcontactcell in lcontact.cells
                        if periodcell.contains(lcontactcell)
                            # count the occurance of each distint behavior
                            if lcontactcell.lcontact == "left contact supported"
                                frequency += 1
                                tot_time +=(lcontactcell.offset-lcontactcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left contact supported".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left contact suspended"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lcontactcell in lcontact.cells
                        if periodcell.contains(lcontactcell)
                            # count the occurance of each distint behavior
                            if lcontactcell.lcontact == "left contact suspended"
                                frequency += 1
                                tot_time +=(lcontactcell.offset-lcontactcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left contact suspended".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move right"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
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
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move middle".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rhormvcell in rhormv.cells
                        if periodcell.contains(rhormvcell)
                            # count the occurance of each distint behavior
                            if rhormvcell.rhormv == "right hand move left"
                                frequency += 1
                                tot_time +=(rhormvcell.offset-rhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left hand move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move right"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left hand move middle"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move middle"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move middle".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left hand move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lhormvcell in lhormv.cells
                        if periodcell.contains(lhormvcell)
                            # count the occurance of each distint behavior
                            if lhormvcell.lhormv == "left hand move left"
                                frequency += 1
                                tot_time +=(lhormvcell.offset-lhormvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand at head"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at head"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at head".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand at chest"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at chest"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at chest".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right hand at hips"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rvertmvcell in rvertmv.cells
                        if periodcell.contains(rvertmvcell)
                            # count the occurance of each distint behavior
                            if rvertmvcell.rvertmv == "right hand at hips"
                                frequency += 1
                                tot_time +=(rvertmvcell.offset-rvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right hand at hips".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left hand at head"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at head"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at head".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "OFF" "left hand at chest"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at chest"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at chest".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left hand at hips"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for lvertmvcell in lvertmv.cells
                        if periodcell.contains(lvertmvcell)
                            # count the occurance of each distint behavior
                            if lvertmvcell.lvertmv == "left hand at hips"
                                frequency += 1
                                tot_time +=(lvertmvcell.offset-lvertmvcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left hand at hips".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "OFF" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for visattncell in visattn.cells
                        if periodcell.contains(visattncell)
                            # count the occurance of each distint behavior
                            if visattncell.visattn == "vis attn"
                                frequency += 1
                                tot_time +=(visattncell.offset-visattncell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"vis attn".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


# Data output for  "OFF" "face attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for visattncell in visattn.cells
                        if periodcell.contains(visattncell)
                            # count the occurance of each distint behavior
                            if visattncell.visattn == "face attn"
                                frequency += 1
                                tot_time +=(visattncell.offset-visattncell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"face attn".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right bang"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right bang".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right insert"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right insert"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right insert".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right manipulate"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right manipulate"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right manipulate".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right remove"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right remove"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right remove".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right stack"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "right stack"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right stack".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left bang"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rtoyintcell in rtoyint.cells
                        if periodcell.contains(rtoyintcell)
                            # count the occurance of each distint behavior
                            if rtoyintcell.rtoyint == "left bang"
                                frequency += 1
                                tot_time +=(rtoyintcell.offset-rtoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left bang".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left insert"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left insert"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left insert".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left manipulate"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left manipulate"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left manipulate".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left remove"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left remove"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left remove".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left stack"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for ltoyintcell in ltoyint.cells
                        if periodcell.contains(ltoyintcell)
                            # count the occurance of each distint behavior
                            if ltoyintcell.ltoyint == "left stack"
                                frequency += 1
                                tot_time +=(ltoyintcell.offset-ltoyintcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left stack".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for mouthreachcell in mouthreach.cells
                        if periodcell.contains(mouthreachcell)
                            # count the occurance of each distint behavior
                            if mouthreachcell.mouthreach == "try mouth"
                                frequency += 1
                                tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"try mouth".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "right arm fling"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for rarmcell in rarm.cells
                        if periodcell.contains(rarmcell)
                            # count the occurance of each distint behavior
                            if rarmcell.rarm == "right arm fling"
                                frequency += 1
                                tot_time +=(rarmcell.offset-rarmcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"right arm fling".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "left arm fling"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for larmcell in larm.cells
                        if periodcell.contains(larmcell)
                            # count the occurance of each distint behavior
                            if larmcell.larm == "left arm fling"
                                frequency += 1
                                tot_time +=(larmcell.offset-larmcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"left arm fling".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end
# Data output for  "OFF" "trunk move forward"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move forward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move forward".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "trunk move backward"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move backward"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move backward".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "trunk move right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move right"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move right".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end

# Data output for  "OFF" "trunk move left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.deviceonoff == "OFF"
            for periodcell in period.cells
                if assessmentcell.contains(periodcell)
                    frequency = 0
                    tot_time = 0
                    for trunkcell in trunk.cells
                        if periodcell.contains(trunkcell)
                            # count the occurance of each distint behavior
                            if trunkcell.trunk == "trunk move left"
                                frequency += 1
                                tot_time +=(trunkcell.offset-trunkcell.onset)
                            end
                        end
                    end
                    rate =(frequency.to_f)/(((assessmentcell.offset - assessmentcell.onset).to_f/1000.0)/60.0)
                    rateF = format("%0.2f",rate)
                    rateT = format("%0.4f",tot_time.to_f/(assessmentcell.offset - assessmentcell.onset).to_f*100)
                    out_file.syswrite(idcell.id.rjust(18) + "\t" +idcell.initials.rjust(12) + "\t" +idcell.studyphase.rjust(15) + "\t" +idcell.visitnumber.rjust(13) + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +periodcell.periodname.rjust(10)  + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +"trunk move left".rjust(27) + "\t" +"#{frequency}".rjust(20) + "\t" +"#{rateF}".rjust(24) + "\t" +"#{tot_time}".rjust(19) + "\t" +"#{rateT}".rjust(23) + "\t" +"\n")
                end # end of "for" in traversing periodcell
            end # end of "if" in traversing periodcell
        end # end of "for" in traversing assessmentcell
    end # end of "if" in traversing assessmentcell
end


















    #                       ************************************************

    # Copy and paste to add variables as needed to export all of the variables' data with one script

    #                       ************************************************






    # Must also export the period duration information as records

    #for idcell in id.cells
    #    for assessmentcell in assessment.cells
    #        if assessmentcell.assessmentname== "EXALONE"
    #            for periodcell in period.cells
    #                if periodcell.onset >= assessmentcell.onset and periodcell.offset <= assessmentcell.offset
    #                    if assessmentcell.onset >= idcell.onset and assessmentcell.offset <= idcell.offset
    #
    #
    #                       out_file.syswrite(idcell.id.rjust(18)  + "\t" +idcell.initials.rjust(12)  + "\t" +idcell.studyphase.rjust(15)  + "\t" +idcell.visitnumber.rjust(13)  + "\t" +assessmentcell.assessmentname.rjust(14) + "\t" +assessmentcell.deviceonoff.rjust(16)  + "\t" +assessmentcell.assessmentname + "\t" +periodcell.onset.to_s  + "\t" +periodcell.offset.to_s + "\t" +"\n")
                            
                            
                            #                    end
                            #end
                            #end
                            #end
                            #end
                            #end
    
    
    # Final end command follows
    
end

