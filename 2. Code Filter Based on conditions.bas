Attribute VB_Name = "CorrectFilter"

Public Sub CorrectFilter()
    Dim sh As Worksheet
    Set sh = ThisWorkbook.Sheets(3)
    sh.AutoFilterMode = False
    sh.Range("C7:AW7").AutoFilter Field:=7, Criteria1:="name@gmail.com"

    Dim FilteredRange As Range  'get only visible cells in column T
    Set FilteredRange = sh.Range("T:T").SpecialCells(xlCellTypeVisible)

    'search if Check can be found (we don't need to count them, one is enough!)
    If Not FilteredRange.Find(What:="Check", LookAt:=xlWhole, SearchOrder:=xlByRows, MatchByte:=True) Is Nothing Then
        sh.Range("C7:AW7").AutoFilter Field:=18, Criteria1:="Check"
    End If

End Sub
