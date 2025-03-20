#tag Module
Protected Module DesktopRadioButtonExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends r as DesktopRadioButton) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(r.handle)
		  #else
		    #pragma unused r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends r as DesktopRadioButton, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Ptr, value as NSControlSize)
		    
		    setControlSize(r.handle, value)
		  #else
		    #pragma unused r
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImagePosition(extends r as DesktopRadioButton) As NSImagePosition
		  //# Returns the position of the receiver’s image relative to its title, in case of CheckBox or RadioButton returns the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare function imagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as NSImagePosition
		    
		    return imagePosition(r.Handle)
		  #else
		    #pragma Unused r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImagePosition(extends r as DesktopRadioButton, assigns value as NSImagePosition)
		  //# Sets the position of the button's image relative to its title, in case of CheckBox or RadioButton sets the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, inFlag as NSImagePosition)
		    
		    setImagePosition(r.Handle, value)
		  #else
		    #pragma Unused r
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(extends r as DesktopRadioButton) As Boolean
		  //# Returns a Boolean value indicating whether the button is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Ptr) as Boolean
		    
		    return isTransparent(r.handle)
		  #else
		    #pragma unused r
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(extends r as DesktopRadioButton, Assigns value as Boolean)
		  //# Sets whether the receiver is transparent and redraws the receiver if necessary.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Ptr, value as Boolean)
		    
		    setTransparent(r.handle, value)
		  #else
		    #pragma unused r
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
