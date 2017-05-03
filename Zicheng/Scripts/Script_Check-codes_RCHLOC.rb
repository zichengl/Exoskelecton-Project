#Check codes in a datavyu spreadsheet for the RCHLOC assessment, this script will enable you to check the errors of Missing Input , Spelling and Negative time duration
#If you encounter any problems regarding this script, feel free to email me
#Zicheng Liu
#zcliu@udel.edu
require 'Datavyu_API.rb'

#User needs to define names of the columns

id = getVariable("ID")
assessment = getVariable("Assessment")
period = getVariable("Period")
righthand = getVariable("RightHand")
lefthand = getVariable("LeftHand")
visattn = getVariable("VisAttn")
mouthreach = getVariable("MouthReach")

#Assign location of output file. This file will be saved with specified name on Desktop

dir = File.expand_path("~/Desktop")
out_file = File.new(dir + "/#{id.cells[0].id}_#{id.cells[0].visitnumber}_RCHLOC_errors.txt", "w+")

#User needs to define acceptable codes

myMap = {
    # Columns
    'ID' => {
        # Code names 	# Acceptable values
        'id'            =>['']
    },
    'Assessment' => {
        'assessment'    =>['']
    },
    'Period' => {
        'period'        =>['']
    },
    'RightHand' => {
        
        'righthand'		=>	['','right contact', 'try right', 'ventral', 'dorsal', 'open', 'closed','yes','no']
    },
    'LeftHand' => {
        'lefthand'      =>	['','left contact','try left', 'ventral' , 'dorsal', 'open', 'closed','yes','no']
    },
    'VisAttn' => {
        'visattn'       => ['','vis attn']
    },
    
    'MouthReach' => {
        'mouthreach'    => ['','try mouth']
    }
    
}

#Begin error checking

begin

#Tried to check for nested values but could not ge it to work
    
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
#            puts "#{colname} does not exist in spreadsheet. Skipping it." if verbose > 0
            true
        elsif codemap.empty?
#            puts "#{colname} contains no codes. Skipping it." if verbose > 0
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
                    
                    # To check the "Try left" and "Try right" if the first argument is one of these two, the other three parts should be missing
                
                    if v[0] == 'try right' or v[0] == 'try left'
                        next
                    end
                    
                    for val in v
                        if val == ''
                            out_file.syswrite("Missing Input: Invalid column \##{colname}, cell \##{cell.ordinal}, Onset #{cell.onset}, Missing Behavior\n")
                            next
                            
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

    # For checking negative duration error
    myMap.each_pair{
        |colname,codemap|
        codemap.each_pair{
            |codename,legalValues|
            cells = cols[colname].cells
            
            
                for cell in cells
                    v = cell.argvals
                    if cell.onset >= cell.offset
                        out_file.syswrite("Wrong Duration Error: Invalid column \##{colname}, cell \##{cell.ordinal}, onset #{cell.onset}, offset #{cell.offset}\n")
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
end




