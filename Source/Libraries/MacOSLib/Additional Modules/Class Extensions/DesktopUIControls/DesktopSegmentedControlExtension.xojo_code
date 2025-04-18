#tag Module
Protected Module DesktopSegmentedControlExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends s as DesktopSegmentedButton) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends s as DesktopSegmentedButton, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Ptr, value as NSControlSize)
		    
		    setControlSize(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnabledForSegment(extends s as DesktopSegmentedButton, segment as Integer) As Boolean
		  //# Returns a Boolean value indicating whether the specified segment is enabled.
		  
		  #if TargetCocoa then
		    declare function isEnabledForSegment lib CocoaLib selector "isEnabledForSegment:" (obj_id as ptr, segment as Integer) as Boolean
		    
		    return isEnabledForSegment(s.handle, segment)
		  #else
		    #pragma unused s
		    #pragma unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnabledForSegment(extends s as DesktopSegmentedButton, segment as Integer, assigns value as Boolean)
		  //# Sets the enabled state of the specified segment
		  
		  #if TargetCocoa then
		    declare sub setEnabled lib CocoaLib selector "setEnabled:forSegment:" (obj_id as ptr, value as Boolean, segment as Integer)
		    
		    setEnabled(s.handle, value, segment)
		  #else
		    #pragma unused s
		    #pragma unused value
		    #pragma unused segment
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageForSegment(extends s as DesktopSegmentedButton, segment as Integer) As NSImage
		  //# Sets the image for the specified segment.
		  
		  #if TargetCocoa then
		    declare function imageForSegment lib CocoaLib selector "imageForSegment:" (obj_id as ptr, segment as Integer) as Ptr
		    
		    return New NSImage( imageForSegment(s.handle, segment) )
		  #else
		    #pragma unused s
		    #pragma unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageForSegment(extends s as DesktopSegmentedButton, segment as Integer, assigns image as NSImage)
		  //# Sets the image for the specified segment.
		  
		  #if TargetCocoa then
		    declare sub setImage lib CocoaLib selector "setImage:forSegment:" (obj_id as ptr, image as Ptr, segment as Integer)
		    
		    setImage(s.handle, image, segment)
		  #else
		    #pragma unused s
		    #pragma unused segment
		    #pragma unused image
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageScalingForSegment(extends s as DesktopSegmentedButton, segment as integer) As NSImageScaling
		  //# Return the scale factor for the receiver’s image.
		  
		  #if TargetCocoa then
		    declare function ImageScalingForSegment lib CocoaLib selector "imageScalingForSegment:" (obj_id as ptr, segment as Integer) as NSImageScaling
		    
		    return ImageScalingForSegment(s.Handle, segment)
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageScalingForSegment(extends s as DesktopSegmentedButton, segment as integer, assigns ImageScaling as NSImageScaling)
		  //# Sets the scale factor for the receiver’s image.
		  
		  #if TargetCocoa then
		    declare sub setImageScalingForSegment lib CocoaLib selector "setImageScaling:forSegment:" (obj_id as ptr, scaling as NSImageScaling, segment as Integer)
		    
		    setImageScalingForSegment(s.Handle, ImageScaling, segment)
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		    #pragma Unused ImageScaling
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LabelForSegment(extends s as DesktopSegmentedButton, segment as Integer) As String
		  //# Returns the label of the specified segment
		  
		  #if TargetCocoa then
		    declare function labelForSegment lib CocoaLib selector "labelForSegment:" (obj_id as ptr, segment as Integer) as CFStringRef
		    
		    return labelForSegment(s.Handle, segment)
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LabelForSegment(extends s as DesktopSegmentedButton, segment as Integer, assigns stext as String)
		  //# Sets the label for the specified segment.
		  
		  #if TargetCocoa then
		    declare sub setLabelForSegment lib CocoaLib selector "setLabel:forSegment:" (obj_id as ptr, text as CFStringRef, segment as Integer)
		    
		    setLabelForSegment(s.Handle, stext, segment)
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		    #pragma Unused stext
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MenuForSegment(extends s as DesktopSegmentedButton, segment as integer) As NSMenu
		  //# Returns the menu for the specified segment
		  
		  #if TargetCocoa then
		    declare function menuForSegment lib CocoaLib selector "menuForSegment:" (obj_id as Ptr, segment as Integer) as Ptr
		    
		    return New NSMenu(menuForSegment(s.Handle, segment))
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MenuForSegment(extends s as DesktopSegmentedButton, segment as integer, assigns menu as NSMenu)
		  //# Sets the menu for the specified segment.
		  
		  //@menu - The menu you want to add to the segment or 'Nil' to clear the current menu. _
		  // This menu is displayed when the user clicks and holds the mouse button while the mouse is over the segment.
		  
		  #if TargetCocoa then
		    declare sub setMenuforSegment lib CocoaLib selector "setMenu:forSegment:" (obj_id as Ptr, menu as Ptr, segment as Integer)
		    
		    setMenuforSegment(s.Handle, menu, segment)
		  #else
		    #pragma Unused s
		    #pragma Unused segment
		    #pragma Unused menu
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SegmentStyle(extends s as DesktopSegmentedButton) As NSSegmentStyle
		  //# Returns the visual style used to display the receiver.
		  
		  #if TargetCocoa then
		    declare function segmentStyle lib CocoaLib selector "segmentStyle" (obj_id as Ptr) as NSSegmentStyle
		    
		    return segmentStyle(s.handle)
		  #else
		    #pragma unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SegmentStyle(extends s as DesktopSegmentedButton, Assigns value as NSSegmentStyle)
		  //# Sets the visual style used to display the receiver.
		  
		  #if TargetCocoa then
		    declare sub setSegmentStyle lib CocoaLib selector "setSegmentStyle:" (obj_id as Ptr, value as NSSegmentStyle)
		    
		    setSegmentStyle(s.handle, value)
		  #else
		    #pragma unused s
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedForSegment(extends s as DesktopSegmentedButton, Segment as Integer) As Boolean
		  //# Returns a Boolean value indicating whether the specified segment is selected.
		  
		  #if TargetCocoa then
		    declare function isSelectedForSegment lib CocoaLib selector "isSelectedForSegment:" (obj_id as Ptr, segment as Integer) as Boolean
		    
		    return isSelectedForSegment(s.handle, segment)
		  #else
		    #pragma unused s
		    #pragma unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedForSegment(extends s as DesktopSegmentedButton, Segment as Integer, assigns value as Boolean)
		  //# Sets the selected segment of the SegmentedControl.
		  
		  #if TargetCocoa then
		    declare sub setSelectedSegment lib CocoaLib selector "setSelected:forSegment:" (obj_id as Ptr, selected as Boolean, inFlag as Integer)
		    
		    setSelectedSegment(s.Handle, value, Segment)
		  #else
		    #pragma Unused s
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedSegment(extends s as DesktopSegmentedButton) As Integer
		  //# Returns the index of the selected segment of the SegmentedControl.
		  
		  #if TargetCocoa then
		    declare function selectedSegment lib CocoaLib selector "selectedSegment" (obj_id as Ptr) as Integer
		    
		    return selectedSegment(s.Handle)
		  #else
		    #pragma Unused s
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectedSegment(extends s as DesktopSegmentedButton, assigns Value as Integer)
		  //# Sets the selected segment of the SegmentedControl.
		  
		  #if TargetCocoa then
		    declare sub setSelectedSegment lib CocoaLib selector "setSelectedSegment:" (obj_id as Ptr, inFlag as Integer)
		    
		    setSelectedSegment(s.Handle, Value)
		  #else
		    #pragma Unused s
		    #pragma Unused Value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WidthForSegment(extends s as DesktopSegmentedButton, segment as Integer) As Double
		  //# Returns the width of the specified segment.
		  
		  #if TargetCocoa then
		    declare function widthForSegment lib CocoaLib selector "widthForSegment:" (obj_id as Ptr, segment as Integer) as Double
		    
		    return widthForSegment(s.handle, segment)
		  #else
		    #pragma unused s
		    #pragma unused segment
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WidthForSegment(extends s as DesktopSegmentedButton, segment as Integer, assigns width as Double)
		  //# Sets the width of the specified segment.
		  
		  #if TargetCocoa then
		    declare sub setWidth lib CocoaLib selector "setWidth:forSegment:" (obj_id as Ptr, width as Double, segment as Integer)
		    
		    setWidth(s.handle, width, segment)
		  #else
		    #pragma unused s
		    #pragma unused segment
		    #pragma unused width
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSSegmentStyle, Flags = &h0
		Automatic = 0
		  Rounded
		  TexturedRounded
		  RoundRect
		  TexturedSquare
		  Capsule
		  SmallSquare
		  Slider
		Separated
	#tag EndEnum


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
