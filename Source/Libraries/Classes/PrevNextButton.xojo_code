#tag Class
Protected Class PrevNextButton
Inherits DesktopSegmentedButton
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  #pragma Unused base
		  #pragma Unused x
		  #pragma Unused y
		  
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  #pragma Unused selectedItem
		  
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  #if TargetMacOS then
		    me.LabelForSegment(0) = ""
		    me.LabelForSegment(1) = ""
		    
		    me.ImageForSegment(0) = NSImage.GoLeftTemplate
		    me.ImageForSegment(1) = NSImage.GoRightTemplate
		    
		    me.ImageForSegment(0).Template = True
		    me.ImageForSegment(1).Template = True
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  if segmentIndex = 0 then
		    RaiseEvent ActionPrevious
		  else
		    RaiseEvent ActionNext
		  end if
		  
		  RaiseEvent ActionBoth
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ActionBoth()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionNext()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionPrevious()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.EnabledForSegment(1)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  self.EnabledForSegment(1) = Value
			End Set
		#tag EndSetter
		NextEnabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return self.EnabledForSegment(0)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  self.EnabledForSegment(0) = Value
			End Set
		#tag EndSetter
		PreviousEnabled As Boolean
	#tag EndComputedProperty


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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="48"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="24"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacButtonStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="MacButtonStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Capsule"
				"2 - Round Rectangle"
				"3 - Rounded"
				"4 - Textured Rounded"
				"5 - Textured Square"
				"6 - Small Square"
				"7 - Separated"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionStyle"
			Visible=true
			Group="Appearance"
			InitialValue="2"
			Type="SelectionStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
				"2 - None"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Segments"
			Visible=true
			Group="Appearance"
			InitialValue="<\r>"
			Type="String"
			EditorType="SegmentEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreviousEnabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NextEnabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
