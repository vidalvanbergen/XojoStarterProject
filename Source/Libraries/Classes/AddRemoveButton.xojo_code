#tag Class
Protected Class AddRemoveButton
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
		  'self.SegmentStyle = SegmentedControlExtension.NSSegmentStyle.SmallSquare
		  
		  #if TargetMacOS then
		    self.ImageForSegment(0) = NSImage.AddTemplate
		    self.ImageForSegment(0).Template = True
		    self.LabelForSegment(0) = ""
		    
		    self.ImageForSegment(1) = NSImage.RemoveTemplate
		    self.ImageForSegment(1).Template = True
		    self.LabelForSegment(1) = ""
		    
		    self.RemoveEnabled = False
		  #endif
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Pressed(segmentIndex As Integer)
		  if segmentIndex = 0 then
		    RaiseEvent ActionAdd
		  elseif segmentIndex = 1 then
		    RaiseEvent ActionRemove
		  end if
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event ActionAdd()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ActionRemove()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


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
		AddEnabled As Boolean
	#tag EndComputedProperty

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
		RemoveEnabled As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
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
			Name="LockLeft"
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
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
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
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Segments"
			Visible=true
			Group="Appearance"
			InitialValue="+\r-"
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
			Name="AddEnabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoveEnabled"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
