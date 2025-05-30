#tag Class
Protected Class CocoaMenuItemUseSelectionForFind
Inherits CocoaMenuItemFindAbstract
	#tag Event
		Function CocoaTag() As Integer
		  const NSFindPanelActionSetFindString = 7
		  return NSFindPanelActionSetFindString
		End Function
	#tag EndEvent


	#tag Constant, Name = LocalizedText, Type = String, Dynamic = True, Default = \"Use Selection for Find", Scope = Public
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Use Selection for Find"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Auswahl suchen"
		#Tag Instance, Platform = Any, Language = ja, Definition  = \"\xE9\x81\xB8\xE6\x8A\x9E\xE9\x83\xA8\xE5\x88\x86\xE3\x82\x92\xE6\xA4\x9C\xE7\xB4\xA2\xE3\x81\xAB\xE4\xBD\xBF\xE7\x94\xA8"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Rechercher la s\xC3\xA9lection"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Usa selezione per cercare"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Gebruik selectie voor zoekactie"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="HasCheckMark"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Shortcut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
End Class
#tag EndClass
