#tag Module
Protected Module ListboxExtensions
	#tag Method, Flags = &h0
		Function PopUpCellChoices(extends lb As DesktopListbox, row As Integer, column As Integer, choices() As String, celltags() As String) As Boolean
		  // Pop up the menu of choices for this cell.  If the user picks one,
		  // store it in that cell and return True.  Otherwise, return False.
		  
		  Dim menu As New DesktopMenuItem
		  For Each choice As String In choices
		    If choice = "-" Then
		      menu.AddMenu New DesktopMenuItem(DesktopMenuItem.TextSeparator)
		    Else
		      Dim item As New DesktopMenuItem(choice)
		      menu.AddMenu item
		      If choice = lb.CellTextAt(row, column) Then
		        item.HasCheckMark = True
		      End If
		      
		    End If
		  Next
		  
		  Dim choice As DesktopMenuItem = menu.PopUp
		  if choice <> Nil then
		    lb.CellTextAt(row, column) = choice.Text
		    lb.CellTagAt(row, column) = celltags(choices.IndexOf(choice.Text))
		    Return True
		  End If
		  
		  Return False
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
