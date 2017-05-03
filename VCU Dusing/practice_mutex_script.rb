require 'Datavyu_API.rb'

begin
   BOTHHANDS = create_mutually_exclusive("BOTHHANDS", "LEFTHANDTOYCONTACT", "RIGHTHANDTOYCONTACT")
   setColumn("BOTHHANDS", BOTHHANDS)
end