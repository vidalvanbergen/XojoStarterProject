#tag Module
Protected Module DesktopButtonExtension
	#tag Method, Flags = &h0
		Function AlternateImage(extends p as DesktopButton) As Picture
		  //# Sets the image displayed by the button when it’s in its alternate state and, if necessary, redraws the contents of the button.
		  
		  #if TargetCocoa then
		    declare function alternateImage lib CocoaLib selector "alternateImage" (obj_id as Ptr) as Ptr
		    
		    return new NSImage(alternateImage(p.handle))
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlternateImage(extends p as DesktopButton, Assigns image as Picture)
		  //# Returns the image that appears on the button when it’s in its alternate state.
		  
		  #if TargetCocoa then
		    declare sub setAlternateImage lib CocoaLib selector "setAlternateImage:" (obj_id as Ptr, image as Ptr)
		    
		    setAlternateImage(p.handle, New NSImage(image))
		  #else
		    #pragma unused p
		    #pragma unused image
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AlternateTitle(extends p as DesktopButton) As String
		  //# Returns the title that the button displays when it’s in its alternate state.
		  
		  #if TargetCocoa then
		    declare function alternateTitle lib CocoaLib selector "alternateTitle" (obj_id as Ptr) as CFStringRef
		    
		    return alternateTitle(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AlternateTitle(extends p as DesktopButton, Assigns aString as String)
		  //# Sets the title that appears on the button when it’s in its alternate state.
		  
		  #if TargetCocoa then
		    declare sub setAlternateTitle lib CocoaLib selector "setAlternateTitle:" (obj_id as Ptr, aString as CFStringRef)
		    
		    setAlternateTitle(p.handle, aString)
		  #else
		    #pragma unused p
		    #pragma unused aString
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BezelStyle(extends p as DesktopButton) As NSBezelStyle
		  //# Returns the appearance of the receiver’s border.
		  
		  #if TargetCocoa then
		    declare function bezelStyle lib CocoaLib selector "bezelStyle" (obj_id as Ptr) as NSBezelStyle
		    
		    return bezelStyle(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BezelStyle(extends p as DesktopButton, Assigns value as NSBezelStyle)
		  //# Sets the appearance of the border, if the receiver has one.
		  
		  #if TargetCocoa then
		    declare sub setBezelStyle lib CocoaLib selector "setBezelStyle:" (obj_id as Ptr, value as NSBezelStyle)
		    
		    setBezelStyle(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bordered(extends p as DesktopButton) As Boolean
		  //# Returns a Boolean value indicating whether the button has a border.
		  
		  #if TargetCocoa then
		    declare function isBordered lib CocoaLib selector "isBordered" (obj_id as Ptr) as Boolean
		    
		    return isBordered(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Bordered(extends p as DesktopButton, Assigns value as Boolean)
		  //# Sets whether the receiver has a bezeled border.
		  
		  #if TargetCocoa then
		    declare sub setBordered lib CocoaLib selector "setBordered:" (obj_id as Ptr, value as Boolean)
		    
		    setBordered(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ButtonType(extends p as DesktopButton, Assigns value as NSButtonType)
		  //# Sets how the pushbutton button highlights while pressed and how it shows its state.
		  
		  #if TargetCocoa then
		    declare sub setButtonType lib CocoaLib selector "setButtonType:" (obj_id as Ptr, value as NSButtonType)
		    
		    setButtonType(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ControlSize(Extends p as DesktopButton) As NSControlSize
		  
		  #if TargetCocoa
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends p as DesktopButton, Assigns value as NSControlSize)
		  
		  #if TargetCocoa
		    declare sub setControlSize lib CocoaLib selector "setControlSize:" (obj_id as Ptr, value as NSControlSize)
		    
		    setControlSize(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GradientType(extends p as DesktopButton, assigns value as NSGradientType)
		  //# Sets the type of gradient to use for the receiver.
		  
		  #if TargetCocoa then
		    declare function cell lib CocoaLib selector "cell" (obj_id as Ptr) as Ptr
		    declare sub setGradientType lib CocoaLib selector "setGradientType:" (obj_id as Ptr, inFlag as NSGradientType)
		    
		    setGradientType(cell(p.Handle), value)
		  #else
		    #pragma Unused p
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image(extends p as DesktopButton) As NSImage
		  // Returns the image that appears on the pushbutton when it’s in its normal state.
		  
		  #if TargetCocoa then
		    declare function image lib CocoaLib selector "image" (obj_id as Ptr) as Ptr
		    
		    return New NSImage(image(p.handle))
		  #else
		    #pragma unused p
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Image(extends p as DesktopButton, Assigns image as NSImage)
		  //# Sets the button's image and redraws the button.
		  
		  #if TargetCocoa then
		    declare sub setImage lib CocoaLib selector "setImage:" (obj_id as Ptr, image as Ptr)
		    
		    setImage(p.Handle, New NSImage(image) )
		  #else
		    #pragma unused p
		    #pragma unused image
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImagePosition(extends p as DesktopButton) As NSImagePosition
		  //# Returns the position of the receiver’s image relative to its title.
		  
		  #if TargetCocoa then
		    declare function imagePosition lib CocoaLib selector "imagePosition" (obj_id as Ptr) as NSImagePosition
		    
		    return imagePosition(p.Handle)
		  #else
		    #pragma Unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImagePosition(extends p as DesktopButton, assigns value as NSImagePosition)
		  //# Sets the position of the button's image relative to its title.
		  
		  #if TargetCocoa then
		    declare sub setImagePosition lib CocoaLib selector "setImagePosition:" (obj_id as Ptr, inFlag as NSImagePosition)
		    
		    setImagePosition(p.Handle, value)
		  #else
		    #pragma Unused p
		    #pragma Unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImageScaling(Extends p as DesktopButton) As NSImageScaling
		  
		  #if TargetCocoa then
		    declare function imageScaling lib CocoaLib selector "imageScaling" (obj_id as Ptr) as NSImageScaling
		    
		    return imageScaling(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImageScaling(Extends p as DesktopButton, Assigns value as NSImageScaling)
		  
		  #if TargetCocoa
		    declare sub setImageScaling lib CocoaLib selector "setImageScaling:" (obj_id as Ptr, value as NSImageScaling)
		    
		    setImageScaling(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NSButtonObject(extends p as DesktopButton) As NSButton
		  
		  return New NSButton( Ptr( p.Handle ) )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowsBorderOnlyWhileMouseInside(extends p as DesktopButton) As Boolean
		  //# Returns a Boolean value indicating whether the button displays its border only when the cursor is over it.
		  
		  #if TargetCocoa then
		    declare function showsBorderOnlyWhileMouseInside lib CocoaLib selector "showsBorderOnlyWhileMouseInside" (obj_id as Ptr) as Boolean
		    
		    return showsBorderOnlyWhileMouseInside(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowsBorderOnlyWhileMouseInside(extends p as DesktopButton, Assigns value as Boolean)
		  //# Sets whether the receiver’s border is displayed only when the cursor is over the button.
		  
		  #if TargetCocoa then
		    declare sub setShowsBorderOnlyWhileMouseInside lib CocoaLib selector "setShowsBorderOnlyWhileMouseInside:" (obj_id as Ptr, value as Boolean)
		    
		    setShowsBorderOnlyWhileMouseInside(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transparent(extends p as DesktopButton) As Boolean
		  //# Returns a Boolean value indicating whether the button is transparent.
		  
		  #if TargetCocoa then
		    declare function isTransparent lib CocoaLib selector "isTransparent" (obj_id as Ptr) as Boolean
		    
		    return isTransparent(p.handle)
		  #else
		    #pragma unused p
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transparent(extends p as DesktopButton, Assigns value as Boolean)
		  //# Sets whether the receiver is transparent and redraws the receiver if necessary.
		  
		  #if TargetCocoa then
		    declare sub setTransparent lib CocoaLib selector "setTransparent:" (obj_id as Ptr, value as Boolean)
		    
		    setTransparent(p.handle, value)
		  #else
		    #pragma unused p
		    #pragma unused value
		  #endif
		End Sub
	#tag EndMethod


	#tag Enum, Name = NSButtonType, Flags = &h0
		NSMomentaryLightButton = 0
		  NSPushOnPushOffButton
		  NSToggleButton
		  NSSwitchButton
		  NSRadioButton
		  NSMomentaryChangeButton
		  NSOnOffButton
		  NSMomentaryPushInButton
		  NSMomentaryPushButton = 0
		NSMomentaryLight = 7
	#tag EndEnum

	#tag Enum, Name = NSGradientType, Flags = &h0
		NSGradientNone
		  NSGradientConcaveWeak
		  NSGradientConcaveStrong
		  NSGradientConvexWeak
		NSGradientConvexStrong
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
