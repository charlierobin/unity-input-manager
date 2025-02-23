#tag Module
Protected Module Dialogs
	#tag Method, Flags = &h1
		Protected Function askUserAboutSaving(window as DesktopWindow) As UserResponse
		  var d as MessageDialog = new MessageDialog()
		  
		  d.icon = MessageDialog.GraphicQuestion
		  
		  d.ActionButton.Caption = "Yes"
		  
		  d.CancelButton.Caption = "Cancel"
		  d.CancelButton.Visible = true
		  
		  d.AlternateActionButton.Caption = "No"
		  d.AlternateActionButton.Visible = true
		  
		  d.Message = "Do you want to save this document?"
		  
		  d.Explanation = ""
		  
		  var b as MessageDialogButton = d.ShowModal( window )
		  
		  if b = d.ActionButton then
		    
		    return UserResponse.Save
		    
		  elseif b = d.AlternateActionButton then
		    
		    return UserResponse.DontSave
		    
		  else
		    
		    return UserResponse.Cancel
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function confirm(message as String) As Boolean
		  var d as MessageDialog = new MessageDialog()
		  
		  d.icon = MessageDialog.GraphicQuestion
		  
		  d.ActionButton.Caption = "Yes"
		  
		  d.CancelButton.Caption = "No"
		  
		  d.CancelButton.Visible = true
		  
		  d.Message = message
		  
		  d.Explanation = ""
		  
		  var b as MessageDialogButton = d.ShowModal()
		  
		  if b = d.ActionButton then
		    
		    return true
		    
		  else
		    
		    return false
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Enum, Name = UserResponse, Type = Integer, Flags = &h0
		Cancel
		  Save
		DontSave
	#tag EndEnum


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
