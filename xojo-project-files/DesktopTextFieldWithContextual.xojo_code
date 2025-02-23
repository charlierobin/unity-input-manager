#tag Class
Protected Class DesktopTextFieldWithContextual
Inherits DesktopTextFieldWithReturn
	#tag Event
		Function ConstructContextualMenu(base As DesktopMenuItem, x As Integer, y As Integer) As Boolean
		  #pragma unused x
		  #pragma unused y
		  
		  // https://docs.unity3d.com/Manual/class-InputManager.html
		  
		  var alphaMenu as DesktopMenuItem = new DesktopMenuItem( "Letter keys" )
		  
		  for i as Integer = 97 to 122
		    
		    alphaMenu.AddMenu( new DesktopMenuItem( chr( i ) ) )
		    
		  next
		  
		  base.AddMenu( alphaMenu )
		  
		  
		  var numberMenu as DesktopMenuItem = new DesktopMenuItem( "Number keys" )
		  
		  for i as Integer = 0 to 9
		    
		    numberMenu.AddMenu( new DesktopMenuItem( i.ToString() ) )
		    
		  next
		  
		  base.AddMenu( numberMenu )
		  
		  
		  var arrowKeys as DesktopMenuItem = new DesktopMenuItem( "Arrow keys" )
		  
		  arrowKeys.AddMenu( new DesktopMenuItem( "up" ) )
		  arrowKeys.AddMenu( new DesktopMenuItem( "down" ) )
		  arrowKeys.AddMenu( new DesktopMenuItem( "left" ) )
		  arrowKeys.AddMenu( new DesktopMenuItem( "right" ) )
		  
		  base.AddMenu( arrowKeys )
		  
		  
		  var numPadKeys as DesktopMenuItem = new DesktopMenuItem( "Numpad keys" )
		  
		  numPadKeys.AddMenu( new DesktopMenuItem( "[0]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[1]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[2]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[3]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[4]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[5]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[6]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[7]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[8]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[9]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[+]" ) )
		  numPadKeys.AddMenu( new DesktopMenuItem( "[equals]" ) )
		  
		  base.AddMenu( numPadKeys )
		  
		  
		  var modKeys as DesktopMenuItem = new DesktopMenuItem( "Modifier keys" )
		  
		  modKeys.AddMenu( new DesktopMenuItem( "right shift" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "left shift" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "right ctrl" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "left ctrl" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "right alt" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "left alt" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "right cmd" ) )
		  modKeys.AddMenu( new DesktopMenuItem( "left cmd" ) )
		  
		  base.AddMenu( modKeys )
		  
		  
		  var specialKeys as DesktopMenuItem = new DesktopMenuItem( "Special keys" )
		  
		  specialKeys.AddMenu( new DesktopMenuItem( "backspace" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "tab" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "return" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "escape" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "space" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "delete" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "enter" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "insert" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "home" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "end" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "page up" ) )
		  specialKeys.AddMenu( new DesktopMenuItem( "page down" ) )
		  
		  base.AddMenu( specialKeys )
		  
		  
		  var functionKeyMenu as DesktopMenuItem = new DesktopMenuItem( "Function keys" )
		  
		  for i as Integer = 1 to 19
		    
		    functionKeyMenu.AddMenu( new DesktopMenuItem( "f" + i.ToString() ) )
		    
		  next
		  
		  base.AddMenu( functionKeyMenu )
		  
		  
		  var mouseMenu as DesktopMenuItem = new DesktopMenuItem( "Mouse buttons" )
		  
		  for i as Integer = 0 to 9
		    
		    mouseMenu.AddMenu( new DesktopMenuItem( "mouse " + i.ToString() ) )
		    
		  next
		  
		  base.AddMenu( mouseMenu )
		  
		  return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuItemSelected(selectedItem As DesktopMenuItem) As Boolean
		  self.Text = selectedItem.Text
		  
		  return true
		  
		End Function
	#tag EndEvent


	#tag Note, Name = Unity docs about KeyCode
		https://docs.unity3d.com/ScriptReference/KeyCode.html
		
		None    Not assigned (never returned as the result of a keystroke).
		
		Backspace    The backspace key.
		Delete    The forward delete key.
		Tab    The tab key.
		Clear    The Clear key.
		Return    Return key.
		Pause    Pause on PC machines.
		Escape    Escape key.
		Space    Space key.
		Keypad0    Numeric keypad 0.
		Keypad1    Numeric keypad 1.
		Keypad2    Numeric keypad 2.
		Keypad3    Numeric keypad 3.
		Keypad4    Numeric keypad 4.
		Keypad5    Numeric keypad 5.
		Keypad6    Numeric keypad 6.
		Keypad7    Numeric keypad 7.
		Keypad8    Numeric keypad 8.
		Keypad9    Numeric keypad 9.
		KeypadPeriod    Numeric keypad '.'.
		KeypadDivide    Numeric keypad '/'.
		KeypadMultiply    Numeric keypad '*'.
		KeypadMinus    Numeric keypad '-'.
		KeypadPlus    Numeric keypad '+'.
		KeypadEnter    Numeric keypad Enter.
		KeypadEquals    Numeric keypad '='.
		UpArrow    Up arrow key.
		DownArrow    Down arrow key.
		RightArrow    Right arrow key.
		LeftArrow    Left arrow key.
		Insert    Insert key key.
		Home    Home key.
		End    End key.
		PageUp    Page up.
		PageDown    Page down.
		F1    F1 function key.
		F2    F2 function key.
		F3    F3 function key.
		F4    F4 function key.
		F5    F5 function key.
		F6    F6 function key.
		F7    F7 function key.
		F8    F8 function key.
		F9    F9 function key.
		F10    F10 function key.
		F11    F11 function key.
		F12    F12 function key.
		F13    F13 function key.
		F14    F14 function key.
		F15    F15 function key.
		Alpha0    The '0' key on the top of the alphanumeric keyboard.
		Alpha1    The '1' key on the top of the alphanumeric keyboard.
		Alpha2    The '2' key on the top of the alphanumeric keyboard.
		Alpha3    The '3' key on the top of the alphanumeric keyboard.
		Alpha4    The '4' key on the top of the alphanumeric keyboard.
		Alpha5    The '5' key on the top of the alphanumeric keyboard.
		Alpha6    The '6' key on the top of the alphanumeric keyboard.
		Alpha7    The '7' key on the top of the alphanumeric keyboard.
		Alpha8    The '8' key on the top of the alphanumeric keyboard.
		Alpha9    The '9' key on the top of the alphanumeric keyboard.
		Exclaim    Exclamation mark key '!'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha1 instead.
		DoubleQuote    Double quote key '"'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Quote instead.
		Hash    Hash key '#'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha3 instead.
		Dollar    Dollar sign key '$'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha4 instead.
		Percent    Percent '%' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha5 instead.
		Ampersand    Ampersand key '&'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha7 instead.
		Quote    Quote key '.
		LeftParen    Left Parenthesis key '('. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha9 instead.
		RightParen    Right Parenthesis key ')'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha0 instead.
		Asterisk    Asterisk key '*'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha8 instead.
		Plus    Plus key '+'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Equals instead.
		Comma    Comma ',' key.
		Minus    Minus '-' key.
		Period    Period '.' key.
		Slash    Slash '/' key.
		Colon    Colon ':' key.Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Semicolon instead.
		Semicolon    Semicolon ';' key.
		Less    Less than '<' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Comma instead.
		Equals    Equals '=' key.
		Greater    Greater than '>' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Period instead.
		Question    Question mark '?' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Slash instead.
		At    At key '@'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha2 instead.
		LeftBracket    Left square bracket key '['.
		Backslash    Backslash key '\'.
		RightBracket    Right square bracket key ']'.
		Caret    Caret key '^'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Alpha6 instead.
		Underscore    Underscore '_' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Minus instead.
		BackQuote    Back quote key '`'.
		A    'a' key.
		B    'b' key.
		C    'c' key.
		D    'd' key.
		E    'e' key.
		F    'f' key.
		G    'g' key.
		H    'h' key.
		I    'i' key.
		J    'j' key.
		K    'k' key.
		L    'l' key.
		M    'm' key.
		N    'n' key.
		O    'o' key.
		P    'p' key.
		Q    'q' key.
		R    'r' key.
		S    's' key.
		T    't' key.
		U    'u' key.
		V    'v' key.
		W    'w' key.
		X    'x' key.
		Y    'y' key.
		Z    'z' key.
		LeftCurlyBracket    Left curly bracket key '{'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.LeftBracket instead.
		Pipe    Pipe '|' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.Backslash instead.
		RightCurlyBracket    Right curly bracket key '}'. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.RightBracket instead.
		Tilde    Tilde '~' key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.BackQuote instead.
		Numlock    Numlock key.
		CapsLock    Capslock key.
		ScrollLock    Scroll lock key.
		RightShift    Right shift key.
		LeftShift    Left shift key.
		RightControl    Right Control key.
		LeftControl    Left Control key.
		RightAlt    Right Alt key.
		LeftAlt    Left Alt key.
		LeftMeta    Maps to left Windows key or left Command key if physical keys are enabled in Input Manager settings, otherwise maps to left Command key only.
		LeftCommand    Left Command key.
		LeftApple    Left Command key.
		LeftWindows    Left Windows key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.LeftMeta instead.
		RightMeta    Maps to right Windows key or right Command key if physical keys are enabled in Input Manager settings, otherwise maps to right Command key only.
		RightCommand    Right Command key.
		RightApple    Right Command key.
		RightWindows    Right Windows key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.RightMeta instead.
		AltGr    Alt Gr key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, use KeyCode.RightAlt instead.
		Help    Help key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, doesn't map to any physical key.
		Print    Print key.
		SysReq    Sys Req key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, doesn't map to any physical key.
		Break    Break key. Deprecated if "Use Physical Keys" is enabled in Input Manager settings, doesn't map to any physical key.
		Menu    Menu key.
		WheelUp    Mouse wheel up.
		WheelDown    Mouse wheel down.
		F16    F16 function key.
		F17    F17 function key.
		F18    F18 function key.
		F19    F19 function key.
		F20    F20 function key.
		F21    F21 function key.
		F22    F22 function key.
		F23    F23 function key.
		F24    F24 function key.
		Mouse0    The Left (or primary) mouse button.
		Mouse1    Right mouse button (or secondary mouse button).
		Mouse2    Middle mouse button (or third button).
		Mouse3    Additional (fourth) mouse button.
		Mouse4    Additional (fifth) mouse button.
		Mouse5    Additional (or sixth) mouse button.
		Mouse6    Additional (or seventh) mouse button.
		JoystickButton0    Button 0 on any joystick.
		JoystickButton1    Button 1 on any joystick.
		JoystickButton2    Button 2 on any joystick.
		JoystickButton3    Button 3 on any joystick.
		JoystickButton4    Button 4 on any joystick.
		JoystickButton5    Button 5 on any joystick.
		JoystickButton6    Button 6 on any joystick.
		JoystickButton7    Button 7 on any joystick.
		JoystickButton8    Button 8 on any joystick.
		JoystickButton9    Button 9 on any joystick.
		JoystickButton10    Button 10 on any joystick.
		JoystickButton11    Button 11 on any joystick.
		JoystickButton12    Button 12 on any joystick.
		JoystickButton13    Button 13 on any joystick.
		JoystickButton14    Button 14 on any joystick.
		JoystickButton15    Button 15 on any joystick.
		JoystickButton16    Button 16 on any joystick.
		JoystickButton17    Button 17 on any joystick.
		JoystickButton18    Button 18 on any joystick.
		JoystickButton19    Button 19 on any joystick.
		Joystick1Button0    Button 0 on first joystick.
		Joystick1Button1    Button 1 on first joystick.
		Joystick1Button2    Button 2 on first joystick.
		Joystick1Button3    Button 3 on first joystick.
		Joystick1Button4    Button 4 on first joystick.
		Joystick1Button5    Button 5 on first joystick.
		Joystick1Button6    Button 6 on first joystick.
		Joystick1Button7    Button 7 on first joystick.
		Joystick1Button8    Button 8 on first joystick.
		Joystick1Button9    Button 9 on first joystick.
		Joystick1Button10    Button 10 on first joystick.
		Joystick1Button11    Button 11 on first joystick.
		Joystick1Button12    Button 12 on first joystick.
		Joystick1Button13    Button 13 on first joystick.
		Joystick1Button14    Button 14 on first joystick.
		Joystick1Button15    Button 15 on first joystick.
		Joystick1Button16    Button 16 on first joystick.
		Joystick1Button17    Button 17 on first joystick.
		Joystick1Button18    Button 18 on first joystick.
		Joystick1Button19    Button 19 on first joystick.
		Joystick2Button0    Button 0 on second joystick.
		Joystick2Button1    Button 1 on second joystick.
		Joystick2Button2    Button 2 on second joystick.
		Joystick2Button3    Button 3 on second joystick.
		Joystick2Button4    Button 4 on second joystick.
		Joystick2Button5    Button 5 on second joystick.
		Joystick2Button6    Button 6 on second joystick.
		Joystick2Button7    Button 7 on second joystick.
		Joystick2Button8    Button 8 on second joystick.
		Joystick2Button9    Button 9 on second joystick.
		Joystick2Button10    Button 10 on second joystick.
		Joystick2Button11    Button 11 on second joystick.
		Joystick2Button12    Button 12 on second joystick.
		Joystick2Button13    Button 13 on second joystick.
		Joystick2Button14    Button 14 on second joystick.
		Joystick2Button15    Button 15 on second joystick.
		Joystick2Button16    Button 16 on second joystick.
		Joystick2Button17    Button 17 on second joystick.
		Joystick2Button18    Button 18 on second joystick.
		Joystick2Button19    Button 19 on second joystick.
		Joystick3Button0    Button 0 on third joystick.
		Joystick3Button1    Button 1 on third joystick.
		Joystick3Button2    Button 2 on third joystick.
		Joystick3Button3    Button 3 on third joystick.
		Joystick3Button4    Button 4 on third joystick.
		Joystick3Button5    Button 5 on third joystick.
		Joystick3Button6    Button 6 on third joystick.
		Joystick3Button7    Button 7 on third joystick.
		Joystick3Button8    Button 8 on third joystick.
		Joystick3Button9    Button 9 on third joystick.
		Joystick3Button10    Button 10 on third joystick.
		Joystick3Button11    Button 11 on third joystick.
		Joystick3Button12    Button 12 on third joystick.
		Joystick3Button13    Button 13 on third joystick.
		Joystick3Button14    Button 14 on third joystick.
		Joystick3Button15    Button 15 on third joystick.
		Joystick3Button16    Button 16 on third joystick.
		Joystick3Button17    Button 17 on third joystick.
		Joystick3Button18    Button 18 on third joystick.
		Joystick3Button19    Button 19 on third joystick.
		Joystick4Button0    Button 0 on forth joystick.
		Joystick4Button1    Button 1 on forth joystick.
		Joystick4Button2    Button 2 on forth joystick.
		Joystick4Button3    Button 3 on forth joystick.
		Joystick4Button4    Button 4 on forth joystick.
		Joystick4Button5    Button 5 on forth joystick.
		Joystick4Button6    Button 6 on forth joystick.
		Joystick4Button7    Button 7 on forth joystick.
		Joystick4Button8    Button 8 on forth joystick.
		Joystick4Button9    Button 9 on forth joystick.
		Joystick4Button10    Button 10 on forth joystick.
		Joystick4Button11    Button 11 on forth joystick.
		Joystick4Button12    Button 12 on forth joystick.
		Joystick4Button13    Button 13 on forth joystick.
		Joystick4Button14    Button 14 on forth joystick.
		Joystick4Button15    Button 15 on forth joystick.
		Joystick4Button16    Button 16 on forth joystick.
		Joystick4Button17    Button 17 on forth joystick.
		Joystick4Button18    Button 18 on forth joystick.
		Joystick4Button19    Button 19 on forth joystick.
		Joystick5Button0    Button 0 on fifth joystick.
		Joystick5Button1    Button 1 on fifth joystick.
		Joystick5Button2    Button 2 on fifth joystick.
		Joystick5Button3    Button 3 on fifth joystick.
		Joystick5Button4    Button 4 on fifth joystick.
		Joystick5Button5    Button 5 on fifth joystick.
		Joystick5Button6    Button 6 on fifth joystick.
		Joystick5Button7    Button 7 on fifth joystick.
		Joystick5Button8    Button 8 on fifth joystick.
		Joystick5Button9    Button 9 on fifth joystick.
		Joystick5Button10    Button 10 on fifth joystick.
		Joystick5Button11    Button 11 on fifth joystick.
		Joystick5Button12    Button 12 on fifth joystick.
		Joystick5Button13    Button 13 on fifth joystick.
		Joystick5Button14    Button 14 on fifth joystick.
		Joystick5Button15    Button 15 on fifth joystick.
		Joystick5Button16    Button 16 on fifth joystick.
		Joystick5Button17    Button 17 on fifth joystick.
		Joystick5Button18    Button 18 on fifth joystick.
		Joystick5Button19    Button 19 on fifth joystick.
		Joystick6Button0    Button 0 on sixth joystick.
		Joystick6Button1    Button 1 on sixth joystick.
		Joystick6Button2    Button 2 on sixth joystick.
		Joystick6Button3    Button 3 on sixth joystick.
		Joystick6Button4    Button 4 on sixth joystick.
		Joystick6Button5    Button 5 on sixth joystick.
		Joystick6Button6    Button 6 on sixth joystick.
		Joystick6Button7    Button 7 on sixth joystick.
		Joystick6Button8    Button 8 on sixth joystick.
		Joystick6Button9    Button 9 on sixth joystick.
		Joystick6Button10    Button 10 on sixth joystick.
		Joystick6Button11    Button 11 on sixth joystick.
		Joystick6Button12    Button 12 on sixth joystick.
		Joystick6Button13    Button 13 on sixth joystick.
		Joystick6Button14    Button 14 on sixth joystick.
		Joystick6Button15    Button 15 on sixth joystick.
		Joystick6Button16    Button 16 on sixth joystick.
		Joystick6Button17    Button 17 on sixth joystick.
		Joystick6Button18    Button 18 on sixth joystick.
		Joystick6Button19    Button 19 on sixth joystick.
		Joystick7Button0    Button 0 on seventh joystick.
		Joystick7Button1    Button 1 on seventh joystick.
		Joystick7Button2    Button 2 on seventh joystick.
		Joystick7Button3    Button 3 on seventh joystick.
		Joystick7Button4    Button 4 on seventh joystick.
		Joystick7Button5    Button 5 on seventh joystick.
		Joystick7Button6    Button 6 on seventh joystick.
		Joystick7Button7    Button 7 on seventh joystick.
		Joystick7Button8    Button 8 on seventh joystick.
		Joystick7Button9    Button 9 on seventh joystick.
		Joystick7Button10    Button 10 on seventh joystick.
		Joystick7Button11    Button 11 on seventh joystick.
		Joystick7Button12    Button 12 on seventh joystick.
		Joystick7Button13    Button 13 on seventh joystick.
		Joystick7Button14    Button 14 on seventh joystick.
		Joystick7Button15    Button 15 on seventh joystick.
		Joystick7Button16    Button 16 on seventh joystick.
		Joystick7Button17    Button 17 on seventh joystick.
		Joystick7Button18    Button 18 on seventh joystick.
		Joystick7Button19    Button 19 on seventh joystick.
		Joystick8Button0    Button 0 on eighth joystick.
		Joystick8Button1    Button 1 on eighth joystick.
		Joystick8Button2    Button 2 on eighth joystick.
		Joystick8Button3    Button 3 on eighth joystick.
		Joystick8Button4    Button 4 on eighth joystick.
		Joystick8Button5    Button 5 on eighth joystick.
		Joystick8Button6    Button 6 on eighth joystick.
		Joystick8Button7    Button 7 on eighth joystick.
		Joystick8Button8    Button 8 on eighth joystick.
		Joystick8Button9    Button 9 on eighth joystick.
		Joystick8Button10    Button 10 on eighth joystick.
		Joystick8Button11    Button 11 on eighth joystick.
		Joystick8Button12    Button 12 on eighth joystick.
		Joystick8Button13    Button 13 on eighth joystick.
		Joystick8Button14    Button 14 on eighth joystick.
		Joystick8Button15    Button 15 on eighth joystick.
		Joystick8Button16    Button 16 on eighth joystick.
		Joystick8Button17    Button 17 on eighth joystick.
		Joystick8Button18    Button 18 on eighth joystick.
		Joystick8Button19    Button 19 on eighth joystick.
	#tag EndNote


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
			InitialValue="80"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
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
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="ColorGroup"
			EditorType="ColorGroup"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
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
			Name="Password"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="ColorGroup"
			EditorType="ColorGroup"
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
			Name="Underline"
			Visible=true
			Group="Font"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hint"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextAlignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="TextAlignments"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowSpellChecking"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumCharactersAllowed"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValidationMask"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
