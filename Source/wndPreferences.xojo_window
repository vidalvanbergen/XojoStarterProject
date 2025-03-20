#tag DesktopWindow
Begin DesktopWindowPro wndPreferences
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   1182846975
   MenuBarVisible  =   False
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "#MenuItemPreferences.LocalizedText"
   Type            =   0
   Visible         =   True
   Width           =   600
   Begin DesktopPagePanel ppPrefs
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      SelectedPanelIndex=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin PreferenceCheckbox chkAutomaticUpdates
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "#kCheckboxAutomaticUpdates"
         DefaultsName    =   "KUCheckForUpdatesAtStartUp"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "ppPrefs"
         Italic          =   False
         Left            =   190
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   40
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   390
      End
      Begin DesktopSeparator sepArray
         Active          =   False
         AllowAutoDeactivate=   True
         AllowTabStop    =   True
         Enabled         =   True
         Height          =   20
         Index           =   0
         InitialParent   =   "ppPrefs"
         Left            =   268
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         PanelIndex      =   0
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   1
         Tooltip         =   ""
         Top             =   72
         Transparent     =   False
         Visible         =   False
         Width           =   64
         _mIndex         =   0
         _mInitialParent =   ""
         _mName          =   ""
         _mPanelIndex    =   0
      End
      Begin DesktopSeparator sepArray
         Active          =   False
         AllowAutoDeactivate=   True
         AllowTabStop    =   True
         Enabled         =   True
         Height          =   20
         Index           =   1
         InitialParent   =   "ppPrefs"
         Left            =   263
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         PanelIndex      =   0
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         Tooltip         =   ""
         Top             =   326
         Transparent     =   False
         Visible         =   False
         Width           =   64
         _mIndex         =   0
         _mInitialParent =   ""
         _mName          =   ""
         _mPanelIndex    =   0
      End
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  Prefs.Sync
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructToolbar(Toolbar as NSToolbar) As Boolean
		  Toolbar.AllowsUserCustomization = False
		  Toolbar.DisplayMode = NSToolbar.NSToolbarDisplayMode.NSToolbarDisplayModeIconAndLabel
		  'Toolbar.AutosavesConfiguration = True
		  
		  // This is an array of items identifiers to specify the default items (and order) in toolbar
		  // this template is used the first time the app is launched and for defining the default set in toolbar customization
		  Toolbar.DefaultItems = Array( _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  "PrefsGeneral", _
		  "PrefsAdvanced", _
		  NSToolbarFlexibleSpaceItemIdentifier )
		  
		  
		  // This is an array of items identifiers to specify all the allowed items in toolbar
		  // this template is used to populate the toolbar customization panel
		  Toolbar.AllowedItems = Array( _
		  NSToolbarSpaceItemIdentifier, _
		  NSToolbarFlexibleSpaceItemIdentifier, _
		  NSToolbarCustomizeToolbarItemIdentifier, _
		  NSToolbarSeparatorItemIdentifier, _  
		  _ 'NSToolbarShowFontsItemIdentifier, _
		  _ 'NSToolbarShowColorsItemIdentifier, _
		  _ 'NSToolbarPrintItemIdentifier, _
		  _
		  "PrefsGeneral", _
		  "PrefsAdvanced" )
		  
		  // This (optional) array define the items which allows selection (as in Preferences panel often is used)
		  Toolbar.SelectableItems = array( _
		  "PrefsGeneral", _
		  "PrefsAdvanced")
		  
		  // Add toolbar button items using simplified extensions
		  Toolbar.AddButton( "PrefsGeneral", NSImage.PreferencesGeneral, Keywords.kGeneral ) // ( Unique Identifier, Button image, toolbar label )
		  Toolbar.AddButton( "PrefsAdvanced", NSImage.Advanced, Keywords.kAdvanced )
		  
		  // Since we want a couple of selecable toolbar buttons
		  // Select one as a starting point
		  Toolbar.SelectedItemIdentifier = AppSettings.Prefs.Value( "LastPrefSelection", "PrefsGeneral" )
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub Settings()
		  self.PrefFrameName = "wndPreferences"
		  self.PrefToolbarName = "PreferencesToolbar"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarActions(Identifier as String, hitItem as NSMenuItem)
		  Select case Identifier
		  case "prefsGeneral"
		    PanelFlipper(0)
		  case "prefsAdvanced"
		    PanelFlipper(1)
		  End Select
		  
		  Prefs.Value("LastPrefSelection") = Identifier
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PanelFlipper(Index as Integer)
		  // First hide the page panel, do the (smooth-)resize, flip the panel and then show it again.
		  ppPrefs.Visible = False
		  
		  #if TargetMacOS then
		    self.SmoothResize( self.Width, sepArray(Index).Top )
		  #else
		    self.Height = sepArray(Index).Top
		  #endif
		  
		  'self.Height = sepArray(Index).Top
		  ppPrefs.SelectedPanelIndex = Index
		  ppPrefs.Visible = True
		End Sub
	#tag EndMethod


	#tag Constant, Name = kCheckboxAutomaticUpdates, Type = String, Dynamic = True, Default = \"Automatically Check For Updates", Scope = Private
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Automatically Check For Updates"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Automatisch zoeken naar updates"
		#Tag Instance, Platform = Any, Language = sv, Definition  = \"Kontrollera uppdateringar automatiskt"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Automatisch nach Updates suchen"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"V\xC3\xA9rifier automatiquement les mises \xC3\xA0 jours"
	#tag EndConstant


#tag EndWindowCode

#tag Events ppPrefs
	#tag Event
		Sub Opening()
		  Select case Prefs.Value("LastPrefSelection", "PrefsGeneral")
		  case "PrefsGeneral"
		    PanelFlipper(0)
		  case "PrefsAdvanced"
		    PanelFlipper(1)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
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
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
