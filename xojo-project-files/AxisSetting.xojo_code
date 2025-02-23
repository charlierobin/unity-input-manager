#tag Class
Protected Class AxisSetting
	#tag Method, Flags = &h0
		Function asJSON() As JSONItem
		  var s as String = kTemplate
		  
		  s = s.ReplaceAll( "{m_Name}", self.m_Name )
		  
		  s = s.ReplaceAll( "{descriptiveName}", self.descriptiveName )
		  s = s.ReplaceAll( "{descriptiveNegativeName}", self.descriptiveNegativeName )
		  s = s.ReplaceAll( "{negativeButton}", self.negativeButton )
		  s = s.ReplaceAll( "{positiveButton}", self.positiveButton )
		  s = s.ReplaceAll( "{altNegativeButton}", self.altNegativeButton )
		  s = s.ReplaceAll( "{altPositiveButton}", self.altPositiveButton )
		  s = s.ReplaceAll( "{gravity}", self.gravity.ToString() )
		  s = s.ReplaceAll( "{dead}", self.dead.ToString() )
		  s = s.ReplaceAll( "{sensitivity}", self.sensitivity.ToString() )
		  s = s.ReplaceAll( "{snap}", self.snap.ToString().Lowercase() )
		  s = s.ReplaceAll( "{invert}", self.invert.ToString().Lowercase() )
		  s = s.ReplaceAll( "{type}", self.getType() )
		  s = s.ReplaceAll( "{axis}", self.getAxis() )
		  s = s.ReplaceAll( "{joyNum}", self.getJoyNum() )
		  
		  var json as JSONItem = new JSONItem( s )
		  
		  return json
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function asUnityClipboard() As String
		  var json as JSONItem = self.asJSON()
		  
		  return "GenericPropertyJSON:" + json.ToString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function duplicate(original as AxisSetting) As AxisSetting
		  var copy as AxisSetting = new AxisSetting()
		  
		  copy.altNegativeButton = original.altNegativeButton
		  
		  copy.altPositiveButton = original.altPositiveButton
		  
		  copy.axis = original.axis
		  
		  copy.dead = original.dead
		  
		  copy.descriptiveName = original.descriptiveName
		  
		  copy.descriptiveNegativeName = original.descriptiveNegativeName
		  
		  copy.gravity = original.gravity
		  
		  copy.invert = original.invert
		  
		  copy.joyNum = original.joyNum
		  
		  copy.m_Name = original.m_Name
		  
		  copy.negativeButton = original.negativeButton
		  
		  copy.positiveButton = original.positiveButton
		  
		  copy.sensitivity = original.sensitivity
		  
		  copy.snap = original.snap
		  
		  copy.type = original.type
		  
		  return copy
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAxis() As String
		  var s as String = ""
		  
		  if self.type = 2 then
		    
		    s = self.getAxis1()
		    
		  elseif self.type = 1 then
		    
		    s = self.getAxis1()
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAxis1() As String
		  var s as String = ""
		  
		  if self.axis = 0 then
		    
		    s = "X axis"
		    
		  elseif self.axis = 1 then
		    
		    s = "Y axis"
		    
		  elseif self.axis = 2 then
		    
		    s = "3rd axis (Joysticks and Scrollwheel)"
		    
		  else
		    
		    var index as Integer = self.axis + 1
		    
		    s = index.ToString()
		    
		    if index = 21 then
		      
		      s = s + "st"
		      
		    elseif index = 22 then
		      
		      s = s + "nd"
		      
		    elseif index = 23 then
		      
		      s = s + "rd"
		      
		    else
		      
		      s = s + "th"
		      
		    end if
		    
		    s = s + " axis (Joysticks)"
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getClipboardData() As String
		  var s as String = ""
		  
		  s = s + self.m_Name
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getJoyNum() As String
		  var s as String = ""
		  
		  if self.joyNum = 0 then
		    
		    s = "Get Motion from all Joysticks"
		    
		  else
		    
		    s = "Joystick " + self.joyNum.ToString()
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getType() As String
		  var s as String = ""
		  
		  if self.type = 0 then
		    
		    s = "Key or Mouse Button "
		    
		  elseif type = 1 then
		    
		    s = "Mouse Movement"
		    
		  elseif type = 2 then
		    
		    s = "Joystick Axis " 
		    
		  else
		    
		    s = "Unknown type"
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function makeFromClipboardData(data as String) As AxisSetting
		  var entry as AxisSetting = new AxisSetting()
		  
		  entry.m_Name = data
		  
		  return entry
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function negativeButtons() As String
		  var s as String = ""
		  
		  if self.type = 0 then
		    
		    s = self.negativeButton
		    
		    if self.altNegativeButton <> "" then
		      
		      if s <> "" then s = s + ", "
		      
		      s = s + self.altNegativeButton
		      
		    end if
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function newJoystickAxis() As AxisSetting
		  // TODO what are Unity’s defaults? use them here ...
		  
		  var entry as AxisSetting = new AxisSetting()
		  
		  entry.altNegativeButton = ""
		  
		  entry.altPositiveButton = ""
		  
		  entry.axis = 0
		  
		  entry.dead = 0.19
		  
		  entry.descriptiveName = ""
		  
		  entry.descriptiveNegativeName = ""
		  
		  entry.gravity = 0
		  
		  entry.invert = false
		  
		  entry.joyNum = 0
		  
		  entry.m_Name = "New Joystick Axis"
		  
		  entry.negativeButton = ""
		  
		  entry.positiveButton = ""
		  
		  entry.sensitivity = 1
		  
		  entry.snap = false
		  
		  entry.type = 2
		  
		  return entry
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function newKeyOrMouseButtonMovement() As AxisSetting
		  var entry as AxisSetting = new AxisSetting()
		  
		  entry.altNegativeButton = "a"
		  
		  entry.altPositiveButton = "d"
		  
		  entry.axis = 0
		  
		  entry.dead = 0.001
		  
		  entry.descriptiveName = ""
		  
		  entry.descriptiveNegativeName = ""
		  
		  entry.gravity = 3
		  
		  entry.invert = false
		  
		  entry.joyNum = 0
		  
		  entry.m_Name = "New Button (Movement)"
		  
		  entry.negativeButton = "left"
		  
		  entry.positiveButton = "right"
		  
		  entry.sensitivity = 3
		  
		  entry.snap = true
		  
		  entry.type = 0
		  
		  return entry
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function newKeyOrMouseButtonWeapon() As AxisSetting
		  var entry as AxisSetting = new AxisSetting()
		  
		  entry.altNegativeButton = ""
		  
		  entry.altPositiveButton = "mouse 0"
		  
		  entry.axis = 0
		  
		  entry.dead = 0.001
		  
		  entry.descriptiveName = ""
		  
		  entry.descriptiveNegativeName = ""
		  
		  entry.gravity = 1000
		  
		  entry.invert = false
		  
		  entry.joyNum = 0
		  
		  entry.m_Name = "New Button (Weapon)"
		  
		  entry.negativeButton = ""
		  
		  entry.positiveButton = "left ctrl"
		  
		  entry.sensitivity = 1000
		  
		  entry.snap = false
		  
		  entry.type = 0
		  
		  return entry
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function newMouseMovement() As AxisSetting
		  var entry as AxisSetting = new AxisSetting()
		  
		  entry.altNegativeButton = ""
		  
		  entry.altPositiveButton = ""
		  
		  entry.axis = 0
		  
		  entry.dead = 0
		  
		  entry.descriptiveName = ""
		  
		  entry.descriptiveNegativeName = ""
		  
		  entry.gravity = 0
		  
		  entry.invert = false
		  
		  entry.joyNum = 0
		  
		  entry.m_Name = "New Mouse Movement"
		  
		  entry.negativeButton = ""
		  
		  entry.positiveButton = "a"
		  
		  entry.sensitivity = 0.1
		  
		  entry.snap = false
		  
		  entry.type = 1
		  
		  return entry
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function positiveButtons() As String
		  var s as String = ""
		  
		  if self.type = 0 then
		    
		    s = self.positiveButton
		    
		    if self.altPositiveButton <> "" then
		      
		      if s <> "" then s = s + ", "
		      
		      s = s + self.altPositiveButton
		      
		    end if
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAxisViaStringEnum(s as String)
		  // poss values:
		  
		  // Enum:X axis
		  // Enum:Y axis
		  // Enum:3rd axis (Joysticks and Scrollwheel)
		  // Enum:4th axis (Joysticks)
		  // Enum:5th axis (Joysticks)
		  // ...
		  // Enum:28th axis (Joysticks)
		  
		  s = s.TrimLeft( "Enum:" )
		  
		  select case s
		    
		  case "X axis"
		    
		    self.axis = 0
		    
		  case "Y axis"
		    
		    self.axis = 1
		    
		  case "3rd axis (Joysticks and Scrollwheel)"
		    
		    self.axis = 2
		    
		  else
		    
		    var i as Integer = val( s )
		    
		    self.axis =  i - 1
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setJoyNumViaStringEnum(s as String)
		  // poss values:
		  
		  // Enum:Get Motion from all Joysticks
		  // Enum:Joystick 1
		  // ...
		  // Enum:Joystick 16
		  
		  s = s.TrimLeft( "Enum:" )
		  
		  select case s
		    
		  case "Get Motion from all Joysticks"
		    
		    self.joyNum = 0
		    
		  else
		    
		    s = s.TrimLeft( "Joystick " )
		    
		    var i as Integer = val( s )
		    
		    self.joyNum =  i
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTypeViaStringEnum(s as String)
		  // poss values:
		  
		  // Enum:Key or Mouse Button
		  // Enum:Mouse Movement
		  // Enum:Joystick Axis
		  
		  s = s.TrimLeft( "Enum:" )
		  
		  select case s
		    
		  case "Key or Mouse Button"
		    
		    self.type = 0
		    
		  case "Mouse Movement"
		    
		    self.type = 1
		    
		  case "Joystick Axis"
		    
		    self.type = 2
		    
		  else
		    
		    raise new RuntimeException( "Unrecognised type: " + s )
		    
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function summary() As String
		  var s as String = ""
		  
		  if self.type = 0 then
		    
		    s = "Key or Mouse Button "
		    
		    // var buttons as String = ""
		    // 
		    // if self.positiveButton <> "" then
		    // 
		    // buttons = "+ " + self.positiveButton
		    // 
		    // end if
		    // 
		    // if self.negativeButton <> "" then
		    // 
		    // if buttons <> "" then buttons = buttons + ", "
		    // 
		    // buttons = buttons + "- " + self.negativeButton
		    // 
		    // end if
		    // 
		    // s = s + "( " + buttons + " )"
		    
		  elseif type = 1 then
		    
		    s = "Mouse Movement"
		    
		  elseif type = 2 then
		    
		    s = "Joystick Axis " 
		    
		    // var axisName as String = ""
		    // 
		    // if self.axis = 0 then
		    // 
		    // axisName = "X axis"
		    // 
		    // elseif self.axis = 1 then
		    // 
		    // axisName = "Y axis"
		    // 
		    // elseif self.axis = 2 then
		    // 
		    // axisName = "3rd axis (Joysticks and Scrollwheel)"
		    // 
		    // else
		    // 
		    // var index as Integer = self.axis + 1
		    // 
		    // axisName = index.ToString() + " axis (Joysticks)"
		    // 
		    // end if
		    // 
		    // s = s + "( " + axisName + " )"
		    
		  else
		    
		    s = "Unknown type"
		    
		  end if
		  
		  return s
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		altNegativeButton As String
	#tag EndProperty

	#tag Property, Flags = &h0
		altPositiveButton As String
	#tag EndProperty

	#tag Property, Flags = &h0
		axis As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		dead As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		descriptiveName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		descriptiveNegativeName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gravity As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		invert As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		joyNum As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		m_Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		negativeButton As String
	#tag EndProperty

	#tag Property, Flags = &h0
		positiveButton As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sensitivity As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		snap As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		type As Integer
	#tag EndProperty


	#tag Constant, Name = kTemplate, Type = String, Dynamic = False, Default = \"{\n\"name\":\"data\"\x2C\n\"type\":-1\x2C\n\"children\":[\n{\"name\":\"m_Name\"\x2C\"type\":3\x2C\"val\":\"{m_Name}\"}\x2C\n{\"name\":\"descriptiveName\"\x2C\"type\":3\x2C\"val\":\"{descriptiveName}\"}\x2C\n{\"name\":\"descriptiveNegativeName\"\x2C\"type\":3\x2C\"val\":\"{descriptiveNegativeName}\"}\x2C\n{\"name\":\"negativeButton\"\x2C\"type\":3\x2C\"val\":\"{negativeButton}\"}\x2C\n{\"name\":\"positiveButton\"\x2C\"type\":3\x2C\"val\":\"{positiveButton}\"}\x2C\n{\"name\":\"altNegativeButton\"\x2C\"type\":3\x2C\"val\":\"{altNegativeButton}\"}\x2C\n{\"name\":\"altPositiveButton\"\x2C\"type\":3\x2C\"val\":\"{altPositiveButton}\"}\x2C\n{\"name\":\"gravity\"\x2C\"type\":2\x2C\"val\":{gravity}}\x2C\n{\"name\":\"dead\"\x2C\"type\":2\x2C\"val\":{dead}}\x2C\n{\"name\":\"sensitivity\"\x2C\"type\":2\x2C\"val\":{sensitivity}}\x2C\n{\"name\":\"snap\"\x2C\"type\":1\x2C\"val\":{snap}}\x2C\n{\"name\":\"invert\"\x2C\"type\":1\x2C\"val\":{invert}}\x2C\n{\"name\":\"type\"\x2C\"type\":7\x2C\"val\":\"Enum:{type}\"}\x2C\n{\"name\":\"axis\"\x2C\"type\":7\x2C\"val\":\"Enum:{axis}\"}\x2C\n{\"name\":\"joyNum\"\x2C\"type\":7\x2C\"val\":\"Enum:{joyNum}\"}\n]\n}", Scope = Private
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
		#tag ViewProperty
			Name="m_Name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="descriptiveName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="descriptiveNegativeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="negativeButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="positiveButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="altNegativeButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="altPositiveButton"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gravity"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="dead"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="sensitivity"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="snap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="invert"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="axis"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="joyNum"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
