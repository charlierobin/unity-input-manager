#tag Interface
Protected Interface InterfaceCanHostListBoxOfAxes
	#tag Method, Flags = &h0
		Sub editClear()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editCut()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editPaste()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectionChanged()
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
