#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub DocumentOpened(item As FolderItem)
		  var w as WindowMain = WindowMain.findFor( item )
		  
		  if w <> nil then
		    
		    w.Show()
		    
		    return
		    
		  end if
		  
		  try
		    
		    var asset as InputManagerAsset = InputManagerAsset.fromFile( item )
		    
		    WindowMain.newFor( asset, item )
		    
		  catch e as RuntimeException
		    
		    MessageBox( e.Message )
		    
		  end try
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AboutTheApp() As Boolean Handles AboutTheApp.Action
		  WindowAbout.open()
		  
		  return true
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewInputManagerAsset() As Boolean Handles NewInputManagerAsset.Action
		  WindowMain.newDefault()
		  
		  return true
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenInputManagerAsset() As Boolean Handles OpenInputManagerAsset.Action
		  var dlg as OpenFileDialog = new OpenFileDialog()
		  
		  dlg.ActionButtonCaption = "Select Asset File(s)"
		  dlg.CancelButtonCaption = "Cancel"
		  dlg.SuggestedFileName = ""
		  dlg.Title = "Select Files"
		  dlg.PromptText = "Select one or more Unity InputManager asset files"
		  
		  // dlg.InitialFolder = SpecialFolder.Documents
		  
		  dlg.AllowMultipleSelections = True
		  
		  var f as FolderItem = dlg.ShowModal()
		  
		  if f <> nil then
		    
		    var w as WindowMain = WindowMain.findFor( f )
		    
		    if w <> nil then
		      
		      w.Show()
		      
		    else
		      
		      for each file as Folderitem in dlg.SelectedFiles( true )
		        
		        try
		          
		          var asset as InputManagerAsset = InputManagerAsset.fromFile( file )
		          
		          WindowMain.newFor( asset, file )
		          
		        catch e as RuntimeException
		          
		          MessageBox( e.Message )
		          
		        end try
		        
		      next
		      
		    end if
		    
		  end if
		  
		  return true
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ShowTemplatesWindow() As Boolean Handles ShowTemplatesWindow.Action
		  var templatesWindow as WindowTemplates = nil
		  
		  for each w as DesktopWindow in self.Windows()
		    
		    if w isA WindowTemplates then
		      
		      templatesWindow = WindowTemplates( w )
		      
		      exit
		      
		    end if
		    
		  next
		  
		  if templatesWindow is nil then
		    
		    templatesWindow = new WindowTemplates()
		    
		  else
		    
		    templatesWindow.Show()
		    
		  end if
		  
		  return true
		  
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub archiveExisting(f as FolderItem)
		  if f.Exists then 
		    
		    var archiveFolder as FolderItem = SpecialFolder.Documents.Child( "InputManager Assets Archived" )
		    
		    if not archiveFolder.Exists then archiveFolder.CreateFolder()
		    
		    var copiedF as FolderItem = new FolderItem( f.NativePath, FolderItem.PathModes.Native )
		    
		    var unityProjectName as String = self.getUnityProjectName( f )
		    
		    var archivedName as String = copiedF.Name + " " + DateTime.Now().SQLDateTime.ReplaceAll( ":", "." )
		    
		    if unityProjectName <> "" then archivedName = archivedName + " (from " + unityProjectName + ")"
		    
		    copiedF.Name = archivedName
		    
		    copiedF.MoveTo( archiveFolder )
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getUnityProjectName(f as FolderItem) As String
		  var unityProjectName as String = ""
		  
		  if f.Name = "InputManager.asset" then
		    
		    if f.Parent.Name = "ProjectSettings" then
		      
		      unityProjectName = f.Parent.Parent.Name
		      
		    end if
		    
		  end if
		  
		  return unityProjectName
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		deletionHistory() As AxisSetting
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
