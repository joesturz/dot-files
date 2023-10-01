select * from tblRegistrations where ProgramCode = 'YLEO12' and RegID in 
(select RegID from tblActivityRegistrations where ProgramCode ='YLEO12' and ActivityCode = 'BAG')

insert into tblActivityRegistrations (RegID, ProgramCode, ActivityCode, Attending, Attended, DateEntered,Status)
(select RegID , 'YLEO12', 'BAG', 1,0,GETDATE(), 'CONFIRMED' from tblRegistrations where ProgramCode = 'YLEO12' and RegID not in (472623,
472621,
472622,
472624,
472594,
472593,
472604,
472605,
472603,
472685,
472671,
433562,
472597,
472595,
472596))