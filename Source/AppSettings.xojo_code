#tag Module
Protected Module AppSettings
	#tag Method, Flags = &h1
		Protected Sub AppInit()
		  ExperimentalMode = Keyboard.AsyncShiftKey
		  'InitializeKaju
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckForUpdates(AllowInteraction as Boolean = True)
		  
		  Dim Interaction As Integer
		  If AllowInteraction Then
		    Interaction = Kaju.UpdateChecker.kAllowUpdateWindow + Kaju.UpdateChecker.kAllowErrorDialog '= 136
		  Else
		    Interaction = 0
		  End If
		  
		  UpdateChecker.Execute
		  
		  Dim status As String
		  
		  Select Case UpdateChecker.Result
		  Case Kaju.UpdateChecker.ResultType.UpdateAlreadyInProgress
		    status = "Update already in progress"
		    MessageBox status
		    
		  Case Kaju.UpdateChecker.ResultType.UnsupportedOS
		    status = "This OS is not supported (missing required tools)"
		    MessageBox status
		    
		  Case Kaju.UpdateChecker.ResultType.NoWritePermission
		    status = "Aborted (no write permission)"
		    MessageBox status
		    
		  Case Kaju.UpdateChecker.ResultType.Error
		    status = "Error, user chose to try later"
		    
		  Case Kaju.UpdateChecker.ResultType.IgnoredUpdateAvailable
		    status = "Updates available, but ignored"
		    
		  Case Kaju.UpdateChecker.ResultType.NoUpdateAvailable
		    status = "No updates available"
		    
		  Case Kaju.UpdateChecker.ResultType.UpdateAvailable
		    status = "Updates available"
		    
		  Case Kaju.UpdateChecker.ResultType.RequiredUpdateAvailable
		    status = "Required update available"
		    
		  Else
		    status = "UNKNOWN RESULT"
		    MessageBox status
		    
		  End
		  Log "Kaju.CheckForUpdates :: " + status
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleError(error as RuntimeException, Location as string = "", otherErr as String = "")
		  Log Location, error, 3
		  
		  dim oReporter as new Vi_clsBugReporter
		  oReporter.Report(error, location, otherErr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitializeKaju()
		  if UpdateChecker = Nil then
		    UpdateChecker = new Kaju.UpdateChecker( SupportFolder )
		  end if
		  
		  UpdateChecker.ServerPublicRSAKey = kPublicRSAKey
		  UpdateChecker.UpdateURL = kUpdateFileURL
		  
		  #if TargetMacOS then
		    UpdateChecker.DefaultImage = App.ApplicationBundle.Icon(128)
		  #else
		    'UpdateChecker.DefaultImage = AppIcon
		  #endif
		  UpdateChecker.DefaultUseTransparency = true
		  
		  dim Interaction as Integer = Kaju.UpdateChecker.kAllowUpdateWindow + Kaju.UpdateChecker.kAllowErrorDialog '= 136
		  
		  UpdateChecker.HonorIgnored = True
		  UpdateChecker.AllowedInteraction = Interaction
		  UpdateChecker.AllowedStage = 0
		  UpdateChecker.AllowRedirection = True
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ExperimentalMode As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Static gPrefs as TTsSmartPreferences
			  if gPrefs = Nil then
			    gPrefs = New TTsSmartPreferences( kAppName )
			  end if
			  Return gPrefs
			End Get
		#tag EndGetter
		Protected Prefs As TTsSmartPreferences
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Static gPrettyVersion as String
			  
			  if gPrettyVersion = "" then
			    
			    gPrettyVersion = App.MajorVersion.ToText + "." + App.MinorVersion.ToText
			    
			    if App.BugVersion > 0 then
			      gPrettyVersion = gPrettyVersion + "." + App.BugVersion.ToText
			    end if
			    
			    select case App.StageCode
			    case App.Alpha
			      gPrettyVersion = gPrettyVersion + "a" + App.NonReleaseVersion.ToText
			    case App.Beta
			      gPrettyVersion = gPrettyVersion + "b" + App.NonReleaseVersion.ToText
			    case App.Development
			      gPrettyVersion = gPrettyVersion + "dev" + App.NonReleaseVersion.ToText
			    else
			      '
			    end select
			    
			  end if
			  
			  // v0.0(.0)(α/β/dev)
			  Return gPrettyVersion
			End Get
		#tag EndGetter
		Protected PrettyVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Static gSupportFolder as FolderItem
			  if gSupportFolder = Nil then
			    #if DebugBuild then
			      gSupportFolder = App.ApplicationBundle.Parent.Child("debug-Application Support").Child( AppSettings.kAppName )
			    #else
			      gSupportFolder = SpecialFolder.ApplicationData.Child( AppSettings.kAppName )
			    #endif
			    
			    if NOT gSupportFolder.Exists then
			      gSupportFolder.CreateAsFolder
			    end if
			  end if
			  
			  Return gSupportFolder
			End Get
		#tag EndGetter
		SupportFolder As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected UpdateChecker As Kaju.UpdateChecker
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UpdateInitiater As Kaju.UpdateInitiater
	#tag EndProperty


	#tag Constant, Name = kAppCopyright, Type = String, Dynamic = False, Default = \"\xC2\xA92025 by Vianna Euphoria", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppIdentifier, Type = String, Dynamic = False, Default = \"com.viannaeuphoria.starterproject", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kAppName, Type = String, Dynamic = False, Default = \"Starter Project", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCompanyName, Type = String, Dynamic = False, Default = \"Vitalis Software", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kCopyright, Type = String, Dynamic = False, Default = \"\xC2\xA9 2025 Vianna Euphoria.\nAll Rights Reserved", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDonationURL, Type = String, Dynamic = False, Default = \"https://ko-fi.com/viannaeuphoria", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kEmailAddress, Type = String, Dynamic = False, Default = \"vianna.euphoria@gmail.com", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kPublicRSAKey, Type = String, Dynamic = False, Default = \"30820120300D06092A864886F70D01010105000382010D00308201080282010100AD746D6D9CE5D2B19180107C61C51D89FDEA951A3055A5D9E0AD9921B20441118609014FCF4BD4D3EAEBEB646DF66D844844BEF6CA5953C621E2EBDCB2F18FB5CE43FDD2BF6E7B18D95EFA262E139A5C89BE8CD2CDB159F1787014EFBB6184B81AF961499C0570E1880A6227AA062F8260822ABD97AEA2CB025072905E2AB0ADC78C551327D9FFFE6FD3C583A248A2F98AD88E57F48C45960871ED2840218A3057C5160209213AB78F01FAF051A6FA5CD6041175BF6E430FA640770EAF9F4E46D71978A242C307F355EBF5FD74710368A04BCAC0BEE854D1DFFBA44EE719B262690FA110BF5AE5AE5EEFDBD791C1B605774486F64A9951DFCEC30E4BED8CE359020111", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kUpdateFileURL, Type = String, Dynamic = False, Default = \"http://vitalis.heliohost.org/starterproject/updates/appcast.json", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWebsiteURL, Type = String, Dynamic = False, Default = \"http://vitalis.heliohost.org/", Scope = Protected
	#tag EndConstant


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
	#tag EndViewBehavior
End Module
#tag EndModule
