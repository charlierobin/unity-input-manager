#tag Class
Protected Class InputManagerAsset
	#tag Method, Flags = &h0
		Shared Function fromFile(f as FolderItem) As InputManagerAsset
		  var s as String = ""
		  
		  Files.load( s, f )
		  
		  return InputManagerAsset.fromString( s )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function fromJSON(json as JSONItem) As InputManagerAsset
		  var asset as InputManagerAsset = new InputManagerAsset()
		  
		  // Unity can only copy one axis entry at a time onto the clipboard?
		  
		  var axis as AxisSetting = new AxisSetting()
		  
		  asset.entries.Add( axis )
		  
		  var children as JSONItem = json.Value( "children" )
		  
		  for i as Integer = 0 to children.LastRowIndex()
		    
		    var child as JSONItem = children.ChildAt( i )
		    
		    var name as String = child.Value( "name" )
		    var type as Integer = child.Value( "type" )
		    var val as Variant = child.Value( "val" )
		    
		    #pragma unused type
		    
		    select case name
		      
		    case "m_Name"
		      
		      axis.m_Name = val
		      
		    case "descriptiveName"
		      
		      axis.descriptiveName = val
		      
		    case "descriptiveNegativeName"
		      
		      axis.descriptiveNegativeName = val
		      
		    case "negativeButton"
		      
		      axis.negativeButton = val
		      
		    case "positiveButton"
		      
		      axis.positiveButton = val
		      
		    case "altNegativeButton"
		      
		      axis.altNegativeButton = val
		      
		    case "altPositiveButton"
		      
		      axis.altPositiveButton = val
		      
		    case "gravity"
		      
		      axis.gravity = val
		      
		    case "dead"
		      
		      axis.dead = val
		      
		    case "sensitivity"
		      
		      axis.sensitivity = val
		      
		    case "snap"
		      
		      axis.snap = val
		      
		    case "invert"
		      
		      axis.invert = val
		      
		    case "type"
		      
		      axis.setTypeViaStringEnum( val )
		      
		    case "axis"
		      
		      axis.setAxisViaStringEnum( val )
		      
		    case "joyNum"
		      
		      axis.setJoyNumViaStringEnum( val )
		      
		    else
		      
		      raise new RuntimeException( "Unknown JSON name: " + name + ": " + val.StringValue )
		      
		    end select
		    
		  next
		  
		  return asset
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function fromString(byRef s as String) As InputManagerAsset
		  var asset as InputManagerAsset = nil
		  
		  if s.BeginsWith( "GenericPropertyJSON:" ) then
		    
		    //  Unity doesn’t quite put proper JSON on the clipboard: need to trim off prefix ...
		    
		    s = s.TrimLeft( "GenericPropertyJSON:" )
		    
		    var json as JSONItem = new JSONItem( s )
		    
		    asset = InputManagerAsset.fromJSON( json )
		    
		  elseif s.BeginsWith( "%YAML 1.1" ) then
		    
		    asset = InputManagerAsset.fromYAML( s )
		    
		  else
		    
		    raise new RuntimeException( "String contents not recognised (YAML for file contents, YAML/(semi-)JSON for clipboard)" )
		    
		  end if
		  
		  return asset
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function fromWindowMain(entries() as AxisSetting, m_UsePhysicalKeys as Boolean) As InputManagerAsset
		  var asset as InputManagerAsset = new InputManagerAsset()
		  
		  asset.m_UsePhysicalKeys = m_UsePhysicalKeys
		  
		  asset.entries = entries
		  
		  return asset
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function fromYAML(byRef s as String) As InputManagerAsset
		  s = s.ReplaceLineEndings( EndOfLine().Native )
		  
		  var asset as InputManagerAsset = new InputManagerAsset()
		  
		  var lines() as String = s.Split( EndOfLine().Native )
		  
		  if lines( 0 ) <> "%YAML 1.1" then raise new RuntimeException( "First line not: %YAML 1.1" )
		  
		  lines.RemoveAt( 0 )
		  
		  if lines( 0 ) <> "%TAG !u! tag:unity3d.com,2011:" then raise new RuntimeException( "Second line not: %TAG !u! tag:unity3d.com,2011:" )
		  
		  lines.RemoveAt( 0 )
		  
		  if lines( 0 ) <> "--- !u!13 &1" then raise new RuntimeException( "Third line not: --- !u!13 &1" )
		  
		  lines.RemoveAt( 0 )
		  
		  if lines( 0 ) <> "InputManager:" then raise new RuntimeException( "Fourth line not: InputManager:" )
		  
		  lines.RemoveAt( 0 )
		  
		  var count as Integer = lines.Count
		  
		  var entry as AxisSetting = nil
		  
		  for i as Integer = 1 to count
		    
		    var line as String = lines( 0 ).Trim()
		    
		    lines.RemoveAt( 0 )
		    
		    if line.Contains( "- serializedVersion: 3" ) then
		      
		      entry = new AxisSetting()
		      
		    elseif line.Contains( "m_UsePhysicalKeys:" ) then
		      
		      var bits() as String = line.Split( ": " )
		      
		      asset.m_UsePhysicalKeys = if ( bits( 1 ) = "1", true, false )
		      
		    else
		      
		      var result as Boolean = InputManagerAsset.lookAtLine( line, entry )
		      
		      if result then
		        
		        asset.entries.Add( entry )
		        
		        entry = nil
		        
		      end if
		      
		    end if
		    
		  next
		  
		  return asset
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function lookAtLine(line as String, entry as AxisSetting) As Boolean
		  var bits() as String = line.Split( ": " )
		  
		  var data as String = if ( bits.Count > 1, bits( 1 ), "" )
		  
		  if line.BeginsWith( "m_Name:" ) then
		    
		    entry.m_Name = data
		    
		  elseif line.BeginsWith( "descriptiveName:" ) then
		    
		    entry.descriptiveName = data
		    
		  elseif line.BeginsWith( "descriptiveNegativeName:" ) then
		    
		    entry.descriptiveNegativeName = data
		    
		  elseif line.BeginsWith( "negativeButton:" ) then
		    
		    entry.negativeButton = data
		    
		  elseif line.BeginsWith( "positiveButton:" ) then
		    
		    entry.positiveButton = data
		    
		  elseif line.BeginsWith( "altNegativeButton:" ) then
		    
		    entry.altNegativeButton = data
		    
		  elseif line.BeginsWith( "altPositiveButton:" ) then
		    
		    entry.altPositiveButton = data
		    
		  elseif line.BeginsWith( "gravity:" ) then
		    
		    entry.gravity = val( data )
		    
		  elseif line.BeginsWith( "dead:" ) then
		    
		    entry.dead = val( data )
		    
		  elseif line.BeginsWith( "sensitivity:" ) then
		    
		    entry.sensitivity = val( data )
		    
		  elseif line.BeginsWith( "snap:" ) then
		    
		    entry.snap = if ( data = "0", false, true )
		    
		  elseif line.BeginsWith( "invert:" ) then
		    
		    entry.invert = if ( data = "0", false, true )
		    
		  elseif line.BeginsWith( "type:" ) then
		    
		    entry.type = val( data )
		    
		  elseif line.BeginsWith( "axis:" ) then
		    
		    entry.axis = val( data )
		    
		  elseif line.BeginsWith( "joyNum:" ) then
		    
		    entry.joyNum = val( data )
		    
		    return true
		    
		  else
		    
		    // nothing
		    
		  end if
		  
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toString() As String
		  var lines() as String
		  
		  lines.Add( "%YAML 1.1" )
		  
		  lines.Add( "%TAG !u! tag:unity3d.com,2011:" )
		  lines.Add( "--- !u!13 &1" )
		  lines.Add( "InputManager:" )
		  lines.Add( "  m_ObjectHideFlags: 0" )
		  lines.Add( "  serializedVersion: 2" )
		  lines.Add( "  m_Axes:" )
		  
		  for each entry as AxisSetting in self.entries
		    
		    self.Untitled( entry, lines )
		    
		  next
		  
		  lines.Add( "  m_UsePhysicalKeys: " + if ( self.m_UsePhysicalKeys, "1", "0" ) )
		  
		  var data as String = ""
		  
		  for each line as String in lines
		    
		    data = data + line + EndOfLine().Native
		    
		  next
		  
		  return data
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Untitled(entry as AxisSetting, output() as String)
		  output.Add( "  - serializedVersion: 3" )
		  
		  output.Add( "    m_Name: " + entry.m_Name )
		  
		  output.Add( "    descriptiveName: " + entry.descriptiveName )
		  output.Add( "    descriptiveNegativeName: " + entry.descriptiveNegativeName )
		  output.Add( "    negativeButton: " + entry.negativeButton )
		  output.Add( "    positiveButton: " + entry.positiveButton )
		  output.Add( "    altNegativeButton: " + entry.altNegativeButton )
		  output.Add( "    altPositiveButton: " + entry.altPositiveButton )
		  output.Add( "    gravity: " + entry.gravity.ToString() )
		  output.Add( "    dead: " + entry.dead.ToString() )
		  output.Add( "    sensitivity: " + entry.sensitivity.ToString() )
		  output.Add( "    snap: " + if ( entry.snap, "1", "0" ) )
		  output.Add( "    invert: " + if ( entry.invert, "1", "0" ) )
		  output.Add( "    type: " + entry.type.ToString() )
		  output.Add( "    axis: " + entry.axis.ToString() )
		  output.Add( "    joyNum: " + entry.joyNum.ToString() )
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		entries() As AxisSetting
	#tag EndProperty

	#tag Property, Flags = &h0
		m_UsePhysicalKeys As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="name"
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
		#tag ViewProperty
			Name="m_UsePhysicalKeys"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
