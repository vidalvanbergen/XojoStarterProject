#tag Module
Protected Module DesktopUIControlExtension
	#tag Method, Flags = &h0
		Function AlphaValue(extends c as DesktopUIControl) As Double
		  //# Returns the opacity of the control
		  
		  #if TargetCocoa then
		    declare function alphaValue lib CocoaLib selector "alphaValue" (obj_id as Ptr) as Double
		    
		    return alphaValue(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlphaValue(extends c as DesktopUIControl, Assigns alpha as Double)
		  //# Sets the opacity of the control.
		  
		  #if TargetCocoa
		    declare sub setAlphaValue lib CocoaLib selector "setAlphaValue:" (obj_id as Ptr, alpha as Double)
		    
		    setAlphaValue(c.Handle, alpha)
		    
		  #else
		    #pragma unused c
		    #pragma unused alpha
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bounds(extends c as DesktopControl) As Cocoa.NSRect
		  
		  #if TargetCocoa
		    declare function bounds lib CocoaLib selector "bounds" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return bounds(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bounds(extends c as DesktopControl, Assigns boundsRect as Cocoa.NSRect)
		  
		  #if TargetCocoa
		    declare sub setBounds lib CocoaLib selector "setBounds:" (obj_id as Ptr, boundsRect as Cocoa.NSRect)
		    
		    setBounds(c.Handle, boundsRect)
		    
		  #else
		    #pragma unused c
		    #pragma unused boundsRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BoundsRotation(extends c as DesktopUIControl) As Double
		  
		  #if TargetCocoa
		    declare function boundsRotation lib CocoaLib selector "boundsRotation" (obj_id as Ptr) as Double
		    
		    return boundsRotation(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BoundsRotation(extends c as DesktopUIControl, Assigns angle as Double)
		  
		  #if TargetCocoa
		    declare sub setBoundsRotation lib CocoaLib selector "setBoundsRotation:" (obj_id as Ptr, angle as Double)
		    
		    setBoundsRotation(c.Handle, angle)
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Frame(extends c as DesktopUIControl) As Cocoa.NSRect
		  
		  #if TargetCocoa then
		    declare function frame lib CocoaLib selector "frame" (obj_id as Ptr) as Cocoa.NSRect
		    
		    return frame(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Frame(extends c as DesktopUIControl, Assigns frameRect as Cocoa.NSRect)
		  
		  #if TargetCocoa then
		    declare sub setFrame lib CocoaLib selector "setFrame:" (obj_id as Ptr, frameRect as Cocoa.NSRect)
		    
		    setFrame(c.Handle, frameRect)
		    
		  #else
		    #pragma unused c
		    #pragma unused frameRect
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameCenterRotation(extends c as DesktopUIControl) As Double
		  
		  #if TargetCocoa then
		    declare function frameCenterRotation lib CocoaLib selector "frameCenterRotation" (obj_id as Ptr) as Double
		    
		    return frameCenterRotation(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameCenterRotation(extends c as DesktopUIControl, Assigns angle as Double)
		  //# Rotates the frame of the control about the layer’s position.
		  
		  #if TargetCocoa then
		    declare sub setFrameCenterRotation lib CocoaLib selector "setFrameCenterRotation:" (obj_id as Ptr, angle as Double)
		    
		    setFrameCenterRotation(c.Handle, angle)
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FrameRotation(extends c as DesktopUIControl) As Double
		  //# Returns the control’s rotation about the layer’s position.
		  
		  #if TargetCocoa then
		    declare function frameRotation lib CocoaLib selector "frameRotation" (obj_id as Ptr) as Double
		    
		    return frameRotation(c.Handle)
		    
		  #else
		    #pragma unused c
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FrameRotation(extends c as DesktopUIControl, Assigns angle as Double)
		  
		  #if TargetCocoa then
		    declare sub setFrameRotation lib CocoaLib selector "setFrameRotation:" (obj_id as Ptr, angle as Double)
		    
		    setFrameRotation(c.Handle, angle)
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSControlObject(extends c as DesktopUIControl) As NSControl
		  
		  #if TargetMacOS then
		    return New NSControl( c.Handle )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateByAngle(extends c as DesktopUIControl, angle as Double)
		  //# Rotates the control’s bounds rectangle by a specified degree value around the origin of the coordinate system, (0.0, 0.0).
		  
		  #if TargetCocoa
		    declare sub rotateByAngle lib CocoaLib selector "rotateByAngle:" (obj_id as Ptr, angle as Double)
		    
		    rotateByAngle(c.Handle, angle)
		    
		  #else
		    #pragma unused c
		    #pragma unused angle
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function View(extends c as DesktopUIControl) As NSView
		  
		  #if TargetMacOS then
		    return New NSView( c.Handle )
		  #endif
		End Function
	#tag EndMethod


	#tag Enum, Name = NSBezelStyle, Flags = &h0
		NSRoundedBezelStyle = 1
		  NSRegularSquareBezelStyle
		  NSThickSquareBezelStyle
		  NSThickerSquareBezelStyle
		  NSDisclosureBezelStyle
		  NSShadowlessSquareBezelStyle
		  NSCircularBezelStyle
		  NSTexturedSquareBezelStyle
		  NSHelpButtonBezelStyle
		  NSSmallSquareBezelStyle
		  NSTexturedRoundedBezelStyle
		  NSRoundRectBezelStyle
		  NSRecessedBezelStyle
		  NSRoundedDisclosureBezelStyle
		  NSInlineBezelStyle
		NSSmallIconButtonBezelStyle = 2
	#tag EndEnum

	#tag Enum, Name = NSControlSize, Flags = &h0
		NSRegularControlSize
		  NSSmallControlSize
		NSMiniControlSize
	#tag EndEnum

	#tag Enum, Name = NSImagePosition, Flags = &h0
		NSNoImage
		  NSImageOnly
		  NSImageLeft
		  NSImageRight
		  NSImageBelow
		  NSImageAbove
		NSImageOverlaps
	#tag EndEnum

	#tag Enum, Name = NSImageScaling, Flags = &h0
		ProportionallyDown
		  AxesIndependently
		  None
		ProportionallyUpOrDown
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
