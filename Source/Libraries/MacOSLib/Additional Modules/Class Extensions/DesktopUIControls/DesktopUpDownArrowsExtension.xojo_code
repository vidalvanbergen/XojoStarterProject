#tag Module
Protected Module DesktopUpDownArrowsExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends u as DesktopUpDownArrows) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(u.handle)
		  #else
		    #pragma unused u
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends u as DesktopUpDownArrows, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Ptr, value as NSControlSize)
		    
		    setControlSize(u.handle, value)
		  #else
		    #pragma unused u
		    #pragma unused value
		  #endif
		End Sub
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
