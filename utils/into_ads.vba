' todo:
'   from where to read strFileContent?
'   pass in target fileName
'   pass in ads name
'   concat target file name and ads name

Dim baFileContent As Byte()

Dim strFileContent = "\0\4\1\9"

baFileContent = StrConv(strFileContent, vbFromUnicode)

Dim fileName As String = "C:\users\nschwarz\Desktop\papaya\jinni\test_target" ' todo plus ads part
Dim iFile As Integer: iFile = FreeFile

Open fileName For Binary Lock Read Write As #iFile
Put #iFile, , baFileContent
Close #iFile
