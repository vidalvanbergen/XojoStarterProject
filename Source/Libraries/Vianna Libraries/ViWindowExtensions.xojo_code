#tag Module
Protected Module ViWindowExtensions
	#tag Method, Flags = &h0
		Function IsVisible(Extends w as DesktopWindow) As Boolean
		  // Check whether a window is visible *without* calling it to the front and making it visible in the process.
		  if w <> Nil then
		    for i as Integer = App.WindowCount-1 DownTo 0
		      dim currentWindow as DesktopWindow = App.WindowAt(i)
		      
		      if currentWindow <> Nil and currentWindow = w then
		        Return True
		      end if
		    next
		  end if
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScreenNumber(Extends w as DesktopWindow) As Integer
		  dim x as integer = w.Left
		  dim y as integer= w.top
		  for q as integer = 0 to DesktopDisplay.DisplayCount -1
		    var DesktopScreen as DesktopDisplay = DesktopDisplay.DisplayAt(q)
		    if (x >= DesktopScreen.Left and x <= DesktopScreen.left + DesktopScreen.Width) and( y >= DesktopScreen.top and y <= DesktopScreen.top + DesktopScreen.Height) then
		      return q
		    end if
		  next
		  return -1
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
