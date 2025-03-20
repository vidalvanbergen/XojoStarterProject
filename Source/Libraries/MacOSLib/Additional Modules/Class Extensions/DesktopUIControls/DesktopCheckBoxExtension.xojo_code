#tag Module
Protected Module DesktopCheckBoxExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends c as DesktopCheckBox) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends c as DesktopCheckBox, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Ptr, value as NSControlSize)
		    
		    setControlSize(c.handle, value)
		  #else
		    #pragma unused c
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImagePosition(extends c as DesktopCheckBox) As NSImagePosition
		  //# Returns the position of the receiver’s image relative to its title, in case of CheckBox or RadioButton returns the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare function imagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as NSImagePosition
		    
		    return imagePosition(c.Handle)
		  #else
		    #pragma Unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImagePosition(extends c as DesktopCheckBox, assigns value as NSImagePosition)
		  //# Sets the position of the button's image relative to its title, in case of CheckBox or RadioButton sets the position of the CheckBox or RadioButton relative to its label.
		  
		  #if TargetCocoa then
		    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, inFlag as NSImagePosition)
		    
		    setImagePosition(c.Handle, value)
		  #else
		    #pragma Unused c
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(extends c as DesktopCheckBox) As Boolean
		  //# Returns a Boolean value indicating whether the receiver is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Ptr) as Boolean
		    
		    return isTransparent(c.handle)
		  #else
		    #pragma unused c
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(extends c as DesktopCheckBox, Assigns value as Boolean)
		  //# Sets whether the receiver is transparent and redraws the receiver if necessary.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Ptr, value as Boolean)
		    
		    setTransparent(c.handle, value)
		  #else
		    #pragma unused c
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
