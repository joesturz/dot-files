SELECT c.ProgramCode,a.RoomTypeName, a.RoomTypeId, b.ProgramHotelId, c.SubBlockId, c.SubBlockName, b.FirstBlockDate, b.LastBlockDate
FROM tblRoomTypes a
JOIN tblProgramHotels b ON a.ProgramHotelId = b.ProgramHotelId
JOIN tblSubBlocks c ON c.ProgramCode = b.ProgramCode
JOIN tblRoomTypeSubblocks d ON d.RoomTypeID = a.RoomTypeID AND d.SubBlockID = c.SubBlockId
WHERE b.ProgramCode='1161for'
ORDER By a.RoomTypeName
