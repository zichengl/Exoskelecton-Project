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
    
    out_file = File.new(dir + "/#{ID}_#{INITIALS}_EXALONE_raw.csv", "w+")
    # out_file.syswrite("ID"+"\t"+"Initials"+"\t"+"Studyphase"+"\t"+"Visitnumber"+"\t"+"Assessmentname"+"\t"+"Periodname"+"\t"+"Deviceonoff"+"\t"+"Variable Column"+"\t"+"Starttime"+"\t"+"Endtime"+"\t"+"Totaltime"+"\n")
    
    
    
    # printing nested cells
    
    # prints all info in id cell
    # tells computer which columns to look at & makes sure the coded data fell within the ID, assessment, and period data periods
    
    # Data output for 1st variable column rcontact
    
    for idcell in id.cells
        
            row = idcell.id
            puts "#{row}"
            out_file.puts(row.join(','))

    end
    
rescue StandardError=> e
    puts e.message
    puts e.backtrace
end

