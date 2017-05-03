require 'Datavyu_API.rb'

begin

   out_file = File.expand_path("~/Desktop/Datavyu Practice Files/DataOutput.txt")
   out = File.new(out_file,'w')

   id = getColumn("ID")
   assessment = getColumn("Assessment")
   subassessment = getColumn("Subassessment")
   look = getColumn("LOOK")

   out.write("id" + "\t" + "date" + "\t" + "visittype" + "\t" + "coder" + "\t" + "trialonset" + "\t" +"trialoffset" + "\t" + "looktoy" + "\t" +"lookonset" + "\t" + "lookoffset" + "\t" +"\n")
   for idcell in id.cells
      for task in assessment.cells
         for trial in subassessment.cells
	     for lookcell in look.cells
            	if lookcell.onset >= trial.onset && lookcell.offset <= trial.offset
		    if trial.onset >= task.onset && trial.offset <= task.offset
               # Write the cells' codes to the output file, separated by tabs - the "\t"
               # You must include a newline indicated, "\n" so that the next cells' codes
               # will be output on a new line, giving them their own row.
               out.write(idcell.id + "\t" + idcell.date + "\t" +
                   idcell.visittype + "\t" + idcell.coder + "\t" +
                   trial.onset.to_s + "\t" + trial.offset.to_s + "\t" +
                   lookcell.looktoy + "\t" + lookcell.onset.to_s + "\t" + lookcell.offset.to_s + "\t" + "\n")
               # End the if clause, and the for loops, as well as the script
		    end
		end
            end
         end
      end
   end

end