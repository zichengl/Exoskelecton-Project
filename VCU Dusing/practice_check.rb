require 'Datavyu_API.rb'
begin
   # Check for errors in the coding of a specific column. Notice the square brackets. These denote
   # lists. The basic format is: "columnName", "dumpFile",
   # "codename", ["validcode1", "validcode2", etc],
   # "code2", [ "validcode1", "validcode2", etc], ...

   look = getColumn("LOOK")


   checkValidCodes("LOOK", "", "looktoy", ["L", "N"])

   for lookcell in look.cells
	if lookcell.onset.to_i > lookcell.offset.to_i
	    puts("Error at look cell: " + lookcell.ordinal.to_s + "(offset comes before onset)")
        end
   end


end