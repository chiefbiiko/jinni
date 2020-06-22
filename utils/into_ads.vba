' todo:
'   from where to read strFileContent?
'   pass in target fileName
'   pass in ads name
'   concat target file name and ads name

' --------------------------------------------------------------------------------
' Method:    Write
' Desc:      Write a unicode encoded file to another file's alternate data stream
' Arguments: strFileContent - Input String representing the file
' Returns:   The full path of the infected file including the ads part
' --------------------------------------------------------------------------------
Public Function Write(strFileContent As String, ads As String) As String
  Dim baFileContent As Byte() = StrConv(strFileContent, vbFromUnicode)

  Dim fileName As String = "C:\users\nschwarz\Desktop\papaya\jinni\test_target" ' todo plus ads part
  Dim iFile As Integer: iFile = FreeFile

  Open fileName For Binary Lock Read Write As #iFile
  Put #iFile, , baFileContent
  Close #iFile
End Function
