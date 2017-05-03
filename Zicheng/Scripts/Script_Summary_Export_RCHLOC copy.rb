	#Output the summary data in a datavyu spreadsheet for RCHLOC assessment, this script will enable you to output frequency, nomalized frequency, total time duration and normalized time duration group by every single behavior variable.
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
    lefthand = getVariable("LeftHand")
    visattn = getVariable("VisAttn")
    mouthreach = getVariable("MouthReach")
    
    # Assign location of output file.  This file will save with specified name on Desktop.
    
    dir = File.expand_path("~/Desktop")
    out_file = File.new(dir + "/#{id.cells[0].id}_#{id.cells[0].visitnumber}_RCHLOC_summary.txt", "w+")
    
    # printing the headers of the output file
    
    out_file.syswrite("_fk_participant_id" + "\t" + "Initials" + "\t" + "study_phase" + "\t" + "_fk_visit" + "\t" + "Assessment" + "\t" + "Period" + "\t" + "Device_On_Off" + "\t" + "Behavior" + "\t" + "Total_Frequency" + "\t" + "Normalized_Frequency" + "\t" + "Total_Duration" + "\t" + "Normalized_Duration" + "\t" + "\n")
    
    # printing nested cells
    
    # prints all info in id cell
    # tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods
    
    # Must also export the period duration information as records
    
    # Data output for summerizing the "On" "TOP LEFT" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                frequency = 0
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end
                
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" +  "TOP" + " " + "LEFT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
            end
            end
        end
    end
    
    # Data output for summerizing the "On" "TOP MIDLINE" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    tot_time = 0
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
        
                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)

                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end

                    
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "TOP" + " " + "MIDLINE"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                end
            end
        end
    end
    
    # Data output for summerizing the "On" "TOP RIGHT" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    
                    tot_time = 0
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            
                            if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
                        end
                    end
                     
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "TOP" + " " + "RIGHT"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                end
            end
        end
    end
    
    # Data output for summerizing the "On" "MIDDLE LEFT" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    
                    frequency = 0
                    
                    tot_time = 0

                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end

                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end

                    
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" +   "MIDDLE"  + " " +  "LEFT"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                    
                    

                end
            end
        end
    end
    
    # Data output for summerizing the "On" "MIDDLE MIDLINE" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    
                    tot_time = 0
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
                            
                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end

                    
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "MIDDLE" + " " + "MIDLINE" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                    

                end
            end
        end
    end
    
    # Data output for summerizing the "On" "MIDDLE RIGHT" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    
                    tot_time = 0
                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            
                            
                            if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
                            
                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end
                    
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "MIDDLE" + " " + "RIGHT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                    

                end
            end
        end
    end
    
    # Data output for summerizing the "On" "BOTTOM LEFT" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    
                    tot_time = 0

                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            
                            if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
                                                        
                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                    
                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end

                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "LEFT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                    

                end
            end
        end
    end
    
    # Data output for summerizing the "On" "BOTTOM MIDLINE" period
    
    for idcell in id.cells
        for assessmentcell in assessment.cells
            if assessmentcell.assessmentname == "RCHLOC"
                if assessmentcell.deviceonoff == "ON"
                    frequency = 0
                    
                    tot_time = 0

                    for periodcell in period.cells
                        if assessmentcell.contains(periodcell)
                            
                            if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                                frequency += 1
                                tot_time += (periodcell.offset - periodcell.onset)
                            end
                                                       
                        end
                    end
                    rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                    rateF = format("%.4f",rate)
                    rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)

                    # if a period is missing, the normalized frequency and duration output as "0".
                    if frequency == 0
                        rateF = 0
                        rateT = 0
                    end
                    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "MIDLINE" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                    

                end
            end
        end
    end


# Data output for summerizing the "On" "BOTTOM RIGHT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                frequency = 0
                
                tot_time = 0

                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                                               
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end


                
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "RIGHT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                

            end
        end
    end
end


# Data output for summerizing the "OFF" "TOP LEFT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end

                
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" +  "TOP" + " " + "LEFT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
            end
        end
    end
end

# Data output for summerizing the "OFF" "TOP MIDLINE" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "TOP" + " " + "MIDLINE"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
            end
        end
    end
end

# Data output for summerizing the "OFF" "TOP RIGHT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end


                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "TOP" + " " + "RIGHT"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
            end
        end
    end
end

# Data output for summerizing the "OFF" "MIDDLE LEFT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                
                frequency = 0
                
                tot_time = 0
                
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)


                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end


                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" +   "MIDDLE"  + " " +  "LEFT"  + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                
                
                
            end
        end
    end
end

# Data output for summerizing the "OFF" "MIDDLE MIDLINE" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end

                
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "MIDDLE" + " " + "MIDLINE" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                
                
            end
        end
    end
end

# Data output for summerizing the "OFF" "MIDDLE RIGHT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end

                
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "MIDDLE" + " " + "RIGHT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                
                
            end
        end
    end
end

# Data output for summerizing the "OFF" "BOTTOM LEFT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)

                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end


                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "LEFT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                
                
            end
        end
    end
end

# Data output for summerizing the "OFF" "BOTTOM MIDLINE" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end
                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "MIDLINE" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
            end
        end
    end
end


# Data output for summerizing the "OFF" "BOTTOM RIGHT" period

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                frequency = 0
                
                tot_time = 0
                
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            frequency += 1
                            tot_time += (periodcell.offset - periodcell.onset)
                        end
                        
                    end
                end
                 
                rate =(frequency.to_f)/((tot_time.to_f/1000.0)/60.0)
                rateF = format("%.4f",rate)
                rateT = format("%.4f",tot_time.to_f/tot_time.to_f*100)
                
                # if a period is missing, the normalized frequency and duration output as "0".
                if frequency == 0
                    rateF = 0
                    rateT = 0
                end

                out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + assessmentcell.assessmentname + "\t" + "BOTTOM" + " " + "RIGHT" + "\t" + assessmentcell.deviceonoff   + "\t" + "RCHLOC"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
                
                
            end
        end
    end
end



# Data output for "ON" "TOP LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
rateF = format("%0.2f",rate)
rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")



# Data output for "ON" "TOP MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
rateF = format("%0.2f",rate)
rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")

# Data output for "ON" "TOP RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
rateF = format("%0.2f",rate)
rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")


# Data output for "ON" "MIDDLE LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "ON" "MIDDLE MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "BOTTOM MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "ON" "TOP MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "MIDDLE LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "ON" "MIDDLE MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "BOTTOM MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "TOP LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "TOP MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "MIDDLE MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "TOP MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "MIDDLE MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "TOP MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "MIDDLE MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "TOP MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "TOP RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "ON" "MIDDLE MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "MIDDLE RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "ON"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "ON" "BOTTOM RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "ON"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "ON"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "OFF" "TOP MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "OFF" "MIDDLE MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "BOTTOM MIDLINE" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "right contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "right contact"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "right contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "OFF" "TOP MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



# Data output for "OFF" "MIDDLE MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "BOTTOM MIDLINE" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "try right"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for righthandcell in righthand.cells
                                if periodcell.contains(righthandcell)
                                    # count the occurance of each distint behavior
                                    if righthandcell.righthand == "try right"
                                        frequency += 1
                                        tot_time +=(righthandcell.offset-righthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM MIDLINE" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "left contact"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "left contact"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "left contact"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM MIDLINE" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "try left"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for lefthandcell in lefthand.cells
                                if periodcell.contains(lefthandcell)
                                    # count the occurance of each distint behavior
                                    if lefthandcell.lefthand == "try left"
                                        frequency += 1
                                        tot_time +=(lefthandcell.offset-lefthandcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try left"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM MIDLINE" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "vis attn"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "vis attn"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for visattncell in visattn.cells
                                if periodcell.contains(visattncell)
                                    # count the occurance of each distint behavior
                                    if visattncell.visattn == "vis attn"
                                        frequency += 1
                                        tot_time +=(visattncell.offset-visattncell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "TOP MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "TOP RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "TOP" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "TOP" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end


# Data output for "OFF" "MIDDLE MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "MIDDLE RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "MIDDLE" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "MIDDLE" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM LEFT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "LEFT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "LEFT"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM MIDLINE" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "MIDLINE"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "MIDLINE"   + "\t" + "OFF"   + "\t" + "try mouth"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end

# Data output for "OFF" "BOTTOM RIGHT" "try mouth"

for idcell in id.cells
    for assessmentcell in assessment.cells
        if assessmentcell.assessmentname == "RCHLOC"
            if assessmentcell.deviceonoff == "OFF"
                flag = 0
                frequency = 0
                tot_time = 0
                tot_period_time = 0
                for periodcell in period.cells
                    if assessmentcell.contains(periodcell)
                        if periodcell.periodname == "BOTTOM" && periodcell.hand == "RIGHT"
                            flag = 1
                            tot_period_time += (periodcell.offset - periodcell.onset)
                            for mouthreachcell in mouthreach.cells
                                if periodcell.contains(mouthreachcell)
                                    # count the occurance of each distint behavior
                                    if mouthreachcell.mouthreach == "try mouth"
                                        frequency += 1
                                        tot_time +=(mouthreachcell.offset-mouthreachcell.onset)
                                    end
                                end
                            end
                            
                            
                        end
                    end#of "if" in traversing periodcell
                end#of "for" in traversing periodcell
            end#of "if" in traversing assessmentcell
        end
    end#of "for" in traversing assessmentcell
end

if flag == 1
    
    rate =(frequency.to_f)/((tot_period_time.to_f/1000.0)/60.0)
    rateF = format("%0.2f",rate)
    rateT = format("%0.4f",tot_time.to_f/tot_period_time.to_f*100)
    out_file.syswrite(idcell.id  + "\t" + idcell.initials  + "\t" + idcell.studyphase  + "\t" + idcell.visitnumber  + "\t" + "RCHLOC"  + "\t" +  "BOTTOM" + " " + "RIGHT"   + "\t" + "OFF"   + "\t" + "try right"  + "\t" + "#{frequency}"  + "\t" + "#{rateF}"  + "\t" + "#{tot_time}"  + "\t" + "#{rateT}"  + "\t" + "\n")
end



    #                       ************************************************

    # Copy and paste to add variables as needed to export all of the variables' data with one script

    #                       ************************************************
end






    

