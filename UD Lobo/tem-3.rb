require 'Datavyu_API.rb'

# Returns if the regex does not match arg
def checkTypo(arg,regex)
  return !(arg=~regex)
end

begin
	#w_cell_thresh = 500 # minimum number of ms between consecutive walk cells
	valid_period_values = ['EXALONE', 'BOTTOM']	# Choose Period cells by checking for periodName's value in this array
	valid_RContact_codes =   ['right contact supported', 'right contact suspended']


	rcontactColumn = getVariable('RContact')
	periodColumn = getVariable('Period')


	validPeriods = periodColumn.cells.select{ |x| valid_period_values.include?(x.get_code('periodname')) }

	for rcCell in rcontactColumn.cells
		# Checkt to make sure the right contact cell is nested within a valid period cell
		if not validPeriods.any?{ |x| x.contains(rcCell) }
			puts "RContact cell #{rcCell.ordinal} not bounded."
		end

		# Check to make sure the rcontact code is valid
		if not valid_RContact_codes.include?(rcCell.rcontact)
			puts "RContact cell #{rcCell.ordinal} invalid code: #{rcCell.rcontact}"
		end

		# Make sure offset is greater than or equal to the onset and make sure offset does not equal 0
		if (rcCell.offset == 0) or (rcCell.onset>rcCell.offset)
			puts "RContact cell #{rcCell.ordinal} invalid offset. (#{rcCell.onset},#{rcCell.offset})"
		end
	end

=begin

	validPeriods = periodColumn.cells.select{
		|x|
		(x.PeriodName == 'EXALONE') or (x.PeriodName == 'BOTTOM') or (x.PeriodName == 'MIDDLE')
	}
	
=end

=begin
	for tcell in trial.cells
		puts "CHECKING Period\##{tcell.ordinal}"
		# Select rcontact cells that are temporally nested inside this tcell(Period cell)
		rcontactcells = rcontact.cells.select{
		  |x|
		  tcell.contains(x)
		}
		
		# Loop over all the rcontact cell belonging to this triall(Period cell)
		prevcell = nil # reference to previous cell
		for i in 0..rcontactcells.length-1
		  rcontactcell = rcontactcells[i]

		  # Check if onset is greater than offset
		  if rcontactcell.onset >= rcontactcell.offset
		    puts("\tCELL #{rcontactcell.ordinal} ONSET >= OFFSET")
		  end
		  
		  # Check if locomotion code is a valid code
		  if !(rcontactcell.RContact =~ valid_RContact_codes)
		    puts("\tTYPO #{rcontactcell.ordinal} RContact CODED AS #{rcontactcell.Rcontact}")
		  end
		  
		 
		  # This check identifies consecutive walk cells that are less than w_cell_thresh apart
		  #if (i>0 and 
		    #prevcell.Rcontact=rcontactcell.Rcontact and 
		    #(rcontactcell.onset-prevcell.offset).abs<w_cell_thresh)
		      
		    #puts("\tCELLS #{prevcell.ordinal} and #{rcontactcell.ordinal} are walking bouts with less than #{w_cell_thresh}ms interval")
		    
		  #end
		  
		  prevcell = rcontactcell
		end


		# Check the trial and nested movement cells to make sure that:
		# 1) It contains at least 1 movement cell
		# 2) The first movement cell has same onset as trial
		# 3) The last movement cell has the same offset as trial
		trial_ord = tcell.ordinal
		if rcontactcells.length > 0
			puts("\tFIRST CELL NOT BOUNDED.  CHECK ONSET.") unless rcontactcells[0].onset >= tcell.onset
			puts("\tLAST CELL NOT BOUNDED. CHECK OFFSET.") unless rcontactcells[rcontactcells.length-1].offset <= tcell.offset
		else
			puts("\tNO NESTED CELLS FOUND.")
		end
		  
		  
	end
=end
	puts("TYPOS CHECKED")
end