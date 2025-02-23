#tag Class
Protected Class DesktopListBoxOfAxes
Inherits DesktopListBox
	#tag Event
		Sub Opening()
		  self.makeSimple()
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelectionChanged()
		  var w as InterfaceCanHostListBoxOfAxes = InterfaceCanHostListBoxOfAxes( self.Parent )
		  
		  w.selectionChanged()
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClear() As Boolean Handles EditClear.Action
		  var w as InterfaceCanHostListBoxOfAxes = InterfaceCanHostListBoxOfAxes( self.Parent )
		  
		  w.editClear()
		  
		  return true
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCopy() As Boolean Handles EditCopy.Action
		  var asset as InputManagerAsset = new InputManagerAsset()
		  
		  asset.entries = self.getSelected()
		  
		  var c as Clipboard = new Clipboard()
		  
		  c.Text = asset.toString()
		  
		  c.Close()
		  
		  return true
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditCut() As Boolean Handles EditCut.Action
		  var asset as InputManagerAsset = new InputManagerAsset()
		  
		  asset.entries = self.getSelected()
		  
		  var c as Clipboard = new Clipboard()
		  
		  c.Text = asset.toString()
		  
		  c.Close()
		  
		  self.deleteSelected()
		  
		  self.SelectedRowIndex = -1
		  
		  var w as InterfaceCanHostListBoxOfAxes = InterfaceCanHostListBoxOfAxes( self.Parent )
		  
		  w.editCut()
		  
		  return true
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditPaste() As Boolean Handles EditPaste.Action
		  var c as Clipboard = new Clipboard()
		  
		  if c.TextAvailable() then
		    
		    var data as String = c.Text
		    
		    try
		      
		      var asset as InputManagerAsset = InputManagerAsset.fromString( data )
		      
		      for each entry as AxisSetting in asset.entries
		        
		        self.AddRow( entry )
		        
		        self.SelectedRowIndex = self.LastAddedRowIndex
		        
		        var w as InterfaceCanHostListBoxOfAxes = InterfaceCanHostListBoxOfAxes( self.Parent )
		        
		        w.editPaste()
		        
		      next
		      
		    catch e as RuntimeException
		      
		      MessageBox( e.Message )
		      
		    end try
		    
		  end if
		  
		  return true
		  
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddRow(axis as AxisSetting)
		  self.AddRow( axis.m_Name )
		  
		  self.RowTagAt( self.LastAddedRowIndex ) = axis
		  
		  self.updateRow( self.LastAddedRowIndex, axis )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRowAndSelect(axis as AxisSetting)
		  self.AddRow( axis )
		  
		  self.SelectedRowIndex = self.LastAddedRowIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dataWasUpdated(data as AxisSetting)
		  var i as Integer = self.getIndexFor( data )
		  
		  self.updateRow( i, data )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete(entry as AxisSetting)
		  var i as Integer = self.getIndexFor( entry )
		  
		  self.RemoveRowAt( i )
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteSelected()
		  var selected() as AxisSetting = self.getSelected()
		  
		  for each entry as AxisSetting in selected
		    
		    App.deletionHistory.Add( entry )
		    
		    self.delete( entry )
		    
		  next
		  
		  self.SelectedRowIndex = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub duplicateSelected()
		  var selected() as AxisSetting = self.getSelected()
		  
		  for each entry as AxisSetting in selected
		    
		    var duplicate as AxisSetting = AxisSetting.duplicate( entry )
		    
		    duplicate.m_Name = duplicate.m_Name + " copy"
		    
		    self.AddRow( duplicate )
		    
		  next
		  
		  self.SelectedRowIndex = self.LastAddedRowIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAll() As AxisSetting()
		  var settings() as AxisSetting
		  
		  for each row as DesktopListBoxRow in self.Rows()
		    
		    settings.Add( row.Tag )
		    
		  next
		  
		  return settings
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFirstSelected() As AxisSetting
		  var selected() as AxisSetting = self.getSelected()
		  
		  return selected( 0 )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getIndexFor(entry as AxisSetting) As Integer
		  for i as Integer = 0 to self.LastRowIndex
		    
		    if self.RowTagAt( i ) = entry then return i
		    
		  next
		  
		  return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSelected() As AxisSetting()
		  var selected() as AxisSetting
		  
		  for each row as DesktopListBoxRow in self.Rows()
		    
		    if row.Selected then selected.Add( row.Tag )
		    
		  next
		  
		  return selected
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeDetailed()
		  var columns() as String = kInitialDetailed.Split( kTab )
		  
		  if self.ColumnCount = columns.Count then return
		  
		  var entries() as AxisSetting = self.getAll()
		  
		  var selected() as AxisSetting = self.getSelected()
		  
		  self.RemoveAllRows()
		  
		  self.ColumnCount = columns.Count
		  
		  self.InitialValue = kInitialDetailed
		  
		  self.ColumnWidths = "170,130,190"
		  
		  self.populate( entries )
		  
		  self.selected( selected )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeSimple()
		  var columns() as String = kInitialSimple.Split( kTab )
		  
		  if self.ColumnCount = columns.Count then return
		  
		  var entries() as AxisSetting = self.getAll()
		  
		  var selected() as AxisSetting = self.getSelected()
		  
		  self.RemoveAllRows()
		  
		  self.ColumnCount = columns.Count
		  
		  self.InitialValue = kInitialSimple
		  
		  self.ColumnWidths = "150, 170, 250"
		  
		  self.populate( entries )
		  
		  self.selected( selected )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populate(entries() as AxisSetting)
		  self.RemoveAllRows()
		  
		  for each entry as AxisSetting in entries
		    
		    self.AddRow( entry )
		    
		  next
		  
		  self.SelectedRowIndex = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resized()
		  if self.Width > 1000 then
		    
		    self.makeDetailed()
		    
		  else
		    
		    self.makeSimple()
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub selected(entries() as AxisSetting)
		  for each entry as AxisSetting in entries
		    
		    self.selected( entry )
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub selected(entry as AxisSetting)
		  for i as Integer = 0 to self.LastRowIndex
		    
		    if self.RowTagAt( i ) = entry then
		      
		      self.RowSelectedAt( i ) = true
		      
		      exit
		      
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub updateRow(i as Integer, data as AxisSetting)
		  if self.ColumnCount < 10 then
		    
		    self.CellTextAt( i, 0 ) = data.m_Name
		    self.CellTextAt( i, 1 ) = data.summary()
		    self.CellTextAt( i, 2 ) = data.getAxis()
		    self.CellTextAt( i, 3 ) = data.negativeButtons()
		    self.CellTextAt( i, 4 ) = data.positiveButtons()
		    
		  else
		    
		    self.CellTextAt( i, 0 ) = data.m_Name
		    self.CellTextAt( i, 1 ) = data.descriptiveName
		    self.CellTextAt( i, 2 ) = data.descriptiveNegativeName
		    self.CellTextAt( i, 3 ) = data.negativeButton
		    self.CellTextAt( i, 4 ) = data.positiveButton
		    self.CellTextAt( i, 5 ) = data.altNegativeButton
		    self.CellTextAt( i, 6 ) = data.altPositiveButton
		    self.CellTextAt( i, 7 ) = data.gravity.ToString()
		    self.CellTextAt( i, 8 ) = data.dead.ToString()
		    self.CellTextAt( i, 9 ) = data.sensitivity.ToString()
		    self.CellTextAt( i, 10 ) = if ( data.snap, "yes", "no" )
		    self.CellTextAt( i, 11 ) = if ( data.invert, "yes", "no" )
		    self.CellTextAt( i, 12 ) = data.getType()
		    self.CellTextAt( i, 13 ) = data.getAxis1()
		    self.CellTextAt( i, 14 ) = data.getJoyNum()
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kInitialDetailed, Type = String, Dynamic = False, Default = \"Name\tDescriptive Name\tDescriptive Negative Name\t- Button\t+ Button\tAlt -\tAlt +\tGravity\tDead\tSensitivity\tSnap\tInvert\tType\tAxis\tJoy Num", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInitialSimple, Type = String, Dynamic = False, Default = \"Name\tType\tAxis\t-\t+", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTab, Type = String, Dynamic = False, Default = \"\t", Scope = Private
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
			InitialValue=""
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Visible=false
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Visible=false
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBorder"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
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
			Name="GridLineStyle"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="GridLineStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - Horizontal"
				"2 - Vertical"
				"3 - Both"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeader"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
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
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHorizontalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVerticalScrollbar"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DropIndicatorVisible"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
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
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
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
			Name="Bold"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowResizableColumns"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowDragging"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRowReordering"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowExpandableRows"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="RowSelectionTypes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
