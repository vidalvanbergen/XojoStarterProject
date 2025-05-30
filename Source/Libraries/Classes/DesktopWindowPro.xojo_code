#tag Class
Protected Class DesktopWindowPro
Inherits DesktopWindow
	#tag Event
		Sub Closing()
		  #if NOT TargetMacOS then
		    if PrefFrameName <> "" then
		      self.FrameSaveSet( PrefFrameName )
		    end if
		  #endif
		  call Closing()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Call Settings()
		  
		  PrefFrameName = Trim( PrefFrameName )
		  PrefToolbarName = Trim( PrefToolbarName )
		  
		  // Load/set window position
		  if PrefFrameName <> "" then
		    #if TargetMacOS then
		      if self.SetFrameAutosaveName( PrefFrameName ) then
		        // Succeeded
		      end if
		    #else
		      self.FrameSaveGet( PrefFrameName )
		    #endif
		  end if
		  
		  
		  // Initiate new toolbar
		  #if TargetMacOS then
		    if PrefToolbarName <> "" then
		      Toolbar = New NSToolbar( PrefToolbarName, AddressOf ToolbarActionsDelegate )
		      if ConstructToolbar( Toolbar ) then
		        Self.SetToolbar( Toolbar )
		      end if
		    end if
		  #endif
		  
		  Call Opening()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ToolbarActionsDelegate(Identifier as String, hitItem as NSMenuItem)
		  call ToolbarActions( Identifier, hitItem )
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Closing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructToolbar(Toolbar as NSToolbar) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Settings()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ToolbarActions(Identifier as String, hitItem as NSMenuItem)
	#tag EndHook


	#tag Note, Name = PrefNames
		
		Set PrefFrameName to automatically save and set the window's position.
		
		Set PrefToolbarName to create a new toolbar for Mac OS X, don't forget to add the "ConstructToolbar" event to the window and create your toolbar,
		and the ToolbarActions event to do something when a toolbar item has been pressed.
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected PrefFrameName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefToolbarName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Toolbar As NSToolbar
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="MinimumWidth"
			Visible=true
			Group="Size"
			InitialValue="64"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumHeight"
			Visible=true
			Group="Size"
			InitialValue="64"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumWidth"
			Visible=true
			Group="Size"
			InitialValue="32000"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumHeight"
			Visible=true
			Group="Size"
			InitialValue="32000"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=true
			Group="Frame"
			InitialValue="0"
			Type="Types"
			EditorType="Enum"
			#tag EnumValues
				"0 - Document"
				"1 - Movable Modal"
				"2 - Modal Dialog"
				"3 - Floating Window"
				"4 - Plain Box"
				"5 - Shadowed Box"
				"6 - Rounded Window"
				"7 - Global Floating Window"
				"8 - Sheet Window"
				"9 - Metal Window"
				"11 - Modeless Dialog"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasCloseButton"
			Visible=true
			Group="Frame"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasMaximizeButton"
			Visible=true
			Group="Frame"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasMinimizeButton"
			Visible=true
			Group="Frame"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasFullScreenButton"
			Visible=true
			Group="Frame"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultLocation"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Locations"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Parent Window"
				"2 - Main Screen"
				"3 - Parent Window Screen"
				"4 - Stagger"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackgroundColor"
			Visible=true
			Group="Background"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="Background"
			InitialValue="&hFFFFFF"
			Type="ColorGroup"
			EditorType="ColorGroup"
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
			Name="Interfaces"
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
			Name="Width"
			Visible=true
			Group="Size"
			InitialValue="600"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Size"
			InitialValue="400"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="Frame"
			InitialValue="Untitled"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizeable"
			Visible=true
			Group="Frame"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Composite"
			Visible=false
			Group="OS X (Carbon)"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacProcID"
			Visible=false
			Group="OS X (Carbon)"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Background"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImplicitInstance"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullScreen"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBarVisible"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBar"
			Visible=true
			Group="Menus"
			InitialValue=""
			Type="DesktopMenuBar"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
