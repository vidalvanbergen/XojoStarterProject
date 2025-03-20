#tag Module
Protected Module DesktopProgressWheelExtension
	#tag Method, Flags = &h0
		Function ControlSize(Extends p as DesktopProgressWheel) As NSControlSize
		  
		  #if TargetCocoa
		    
		    declare function controlSize lib CocoaLib selector "controlSize" (obj_id as Ptr) as NSControlSize
		    
		    return controlSize(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ControlSize(Extends p as DesktopProgressWheel, Assigns value as NSControlSize)
		  
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
		Function DisplayedWhenStopped(Extends p as DesktopProgressWheel) As Boolean
		  
		  #if TargetCocoa
		    
		    declare function isDisplayedWhenStopped lib CocoaLib selector "isDisplayedWhenStopped" (obj_id as Ptr) as Boolean
		    
		    return isDisplayedWhenStopped(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayedWhenStopped(Extends p as DesktopProgressWheel, Assigns value as Boolean)
		  
		  #if TargetCocoa
		    
		    declare sub setDisplayedWhenStopped lib CocoaLib selector "setDisplayedWhenStopped:" (obj_id as Ptr, value as Boolean)
		    
		    setDisplayedWhenStopped(p.handle, value)
		    
		  #else
		    
		    #pragma unused p
		    #pragma unused value
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SizeToFit(Extends p as DesktopProgressWheel)
		  
		  #if TargetCocoa
		    
		    declare sub sizeToFit lib CocoaLib selector "sizeToFit" (obj_id as Ptr)
		    
		    sizeToFit(p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartAnimation(Extends p as DesktopProgressWheel)
		  
		  #if TargetCocoa
		    
		    declare sub startAnimation lib CocoaLib selector "startAnimation:" (obj_id as Ptr, sender as Ptr)
		    
		    startAnimation(p.handle, p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAnimation(Extends p as DesktopProgressWheel)
		  
		  #if TargetCocoa
		    
		    declare sub stopAnimation lib CocoaLib selector "stopAnimation:" (obj_id as Ptr, sender as Ptr)
		    
		    stopAnimation(p.handle, p.handle)
		    
		  #else
		    
		    #pragma unused p
		    
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
