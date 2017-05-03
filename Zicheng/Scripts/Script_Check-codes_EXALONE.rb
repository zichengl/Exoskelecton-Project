#Check codes in a datavyu spreadsheet for the EXALONE assessment, this script will enable you to check the errors of Missing Input , Spelling and Negative time duration.Besides this script can also check the continuity of 'rhormv', 'lhormv','rvertmv' and 'lvertmv' columns
#If you encounter any problems regarding this script, feel free to email me
#Zicheng Liu
#zcliu@udel.edu
require 'Datavyu_API.rb'

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

#Assign location of output file. This file will be saved with specified name on Desktop

dir = File.expand_path("~/Desktop")
out_file = File.new(dir + "/#{id.cells[0].id}_#{id.cells[0].visitnumber}_EXALONE_errors.txt", "w+")

#Save constants for continuous error checking

endOnTime = []
endOffTime = []

for assessmentcell in assessment.cells
    if assessmentcell.deviceonoff == "ON"
        endOnTime.push(assessmentcell.offset)
    end
    if assessmentcell.deviceonoff == "OFF"
        endOffTime.push(assessmentcell.offset)
    end
end

#User needs to define acceptable codes

myMap = {
    # Columns
    'ID' =>{
        # Code names 	# Acceptable values
        'id'            =>['']
    },
    'Assessment' =>{
        'assessment'    =>['']
    },
    'Period'   =>{
        'period'        =>['']
    },
    'RContact' => {
        'rcontact'		=>	['','right contact supported', 'right contact suspended'],
    },
    'LContact' => {
        'lcontact'      =>	['','left contact supported','left contact suspended']
    },
    'RHorMv' => {
        'rhormv'        =>	['','right hand move middle','right hand move left','right hand move right']
    },
    'LHorMv' => {
        'lhormv'        =>  ['','left hand move middle','left hand move left','left hand move right']
    },
    'RVertMv'=> {
        'rvertmv'        => ['','right hand at head','right hand at chest', 'right hand at hips']
    },
    'LVertMv' => {
        'lvertmv'        => ['','left hand at head','left hand at chest', 'left hand at hips']
    },
    'VisAttn' => {
        'visattn'       => ['','vis attn', 'face attn']
    },
    'RToyInt' => {
        'rtoyint'       => ['','right bang', 'right insert', 'right manipulate', 'right remove', 'right stack']
    },
    'LToyInt' => {
        'ltoyint'       => ['','left bang', 'left insert', 'left manipulate', 'left remove', 'left stack']
    },
    
    'MouthReach' => {
        'mouthreach'    => ['','try mouth']
    },
    'RArm' => {
        'rarm'       => ['','right arm fling']
    },
    
    'LArm' => {
        'larm'       => ['','left arm fling']
    },
    'Trunk' => {
        'trunk'         => ['','trunk move forward', 'trunk move backward', 'trunk move right', 'trunk move left']
    }
}

#Begin error checking

begin
    
    # Nesting checking tried but not work

    #    for assessmentcell in assessment.cells
    #   for rcontactcell in rcontact.cells
    #       if rcontactcell.is_within(assessmentcell)
    #           puts"Invalid cell \##{rcontactcell.ordinal}, onset #{rcontactcell.onset}, offset #{rcontactcell.offset}"
    #    end
    #   end
    #end

    varList = getVariableList()
    myMap.delete_if{
        |colname,codemap|
        if (not varList.include?(colname))
            puts "#{colname} does not exist in spreadsheet. Skipping it." if verbose > 0
            true
        elsif codemap.empty?
            puts "#{colname} contains no codes. Skipping it." if verbose > 0
            true
        else
            false
        end
    }
    
    cols = {}
    myMap.keys.each{
        |x|
        cols[x] = getColumn(x)
    }
    
    # For Checking Missing Input
    myMap.each_pair{
        |colname,codemap|
            codemap.each_pair{
                |codename,legalValues|
                cells = cols[colname].cells
                
                for cell in cells
                    v = cell.argvals
                    
                    # when checking these three columns, do not need to check the inputs value, just concern about its valid duration
                    if colname == 'ID' or colname == 'Assessment' or colname == 'Period'
                        break
                    end

                    for val in v
                        if val == ''
                            out_file.syswrite("Missing Input :Invalid column \##{colname}, cell \##{cell.ordinal}, Onset #{cell.onset}, Missing Behavior\n")
                        end
                    
                    end
                end
            }
    }
    
    # For Checking Spelling Error
    myMap.each_pair{
        |colname,codemap|
            codemap.each_pair{
                |codename,legalValues|
                cells = cols[colname].cells
                
               
                for cell in cells
                    v = cell.argvals
                    
                    # when checking these three columns, do not need to check the inputs value, just concern about its valid duration
                    if colname == 'ID' or colname == 'Assessment' or colname == 'Period'
                        break
                    end

                    for val in v
                        if not legalValues.include?(val)
                            out_file.syswrite("Spelling Error: Invalid column \##{colname}, cell \##{cell.ordinal}, Onset #{cell.onset}, Behavior:#{val}\n")
                        end
                        
                    end
                end
            }
    }
    
    # For Checking Negative Duration Error
    myMap.each_pair{
        |colname,codemap|
            codemap.each_pair{
                |codename,legalValues|
                cells = cols[colname].cells
            
    
               
                for cell in cells
                v = cell.argvals
                    if cell.onset >= cell.offset
                        out_file.syswrite("Wrong Duration Error:Invalid column \##{colname}, cell \##{cell.ordinal}, onset #{cell.onset}, offset #{cell.offset}\n")
                    end
                end
        }
    }
    
    
    # For Checking behavior cells whether or not in the a period cell
    myMap.each_pair{
        |colname,codemap|
        codemap.each_pair{
            |codename,legalValues|
            cells = cols[colname].cells
            periodcells = cols['Period'].cells
            
            for cell in cells
                
                if colname == 'ID' or colname == 'Assessment' or colname == 'Period'
                    break
                end
                
                flag = 0;
                for periodcell in periodcells
                    
                    if periodcell.contains(cell)
                        flag = 1
                        break
                    end
                end
                
                if flag == 0
                    out_file.syswrite("Wrong Duration Error:Invalid column \##{colname}, cell \##{cell.ordinal}, onset #{cell.onset}, offset #{cell.offset} does not belong to any period cell\n")
                end
            end
        }
    }

    
    
    # For Continuous Duration checking for 4 colunms
    myMap.each_pair{
        |colname,codemap|
            codemap.each_pair{
                |codename,legalValues|
                cells = cols[colname].cells
                

                endTime = 0
                for cell in cells
                v = cell.argvals
                    
                    if codename == 'rhormv' or codename == 'lhormv' or codename == 'rvertmv' or codename == 'lvertmv'
                        
                        if endTime == 0 or endOnTime.include?(endTime) or endOffTime.include?(endTime)
                            endTime = cell.offset
                            next
                        end
                        
                        if cell.onset - endTime != 0
                            out_file.syswrite("Non-continuous Duration Error: Invalid column \##{colname}, cell \##{cell.ordinal}, Onset #{cell.onset}, Previous offset #{endTime}\n")
                        end
                        
                        endTime = cell.offset
                    end
                end
                
                # For consecutive cells same checking for 4 colunms
                # Tried but not worked
                
            }
    }
    
    
end




