#tag Module
Protected Module Files
	#tag Method, Flags = &h21
		Private Function expandFileNameTemplate(f as FolderItem, template as String, exceptionOnError as ExceptionOnErrorFlag) As String
		  // {fullName} {name} {date} {time} {appID} {randomNumber} {randomAlphaNumeric} {randomUUID} {seq} {extension}
		  
		  var nameAndExtension as Pair = splitFileNameAndExtension( f.name )
		  
		  var nameWithNoExtension as String = nameAndExtension.Left
		  
		  var extension as String = nameAndExtension.Right
		  
		  var newName as String = template
		  
		  var dateTime as String = getSQLDateTimePathSafe()
		  
		  var dateTimeSplit() as String = dateTime.Split( " " )
		  
		  var date as String = dateTimeSplit( 0 )
		  
		  var time as String = dateTimeSplit( 1 )
		  
		  newName = newName.ReplaceAll( "{fullName}", f.name )
		  
		  newName = newName.ReplaceAll( "{name}", nameWithNoExtension )
		  
		  newName = newName.ReplaceAll( "{date}", date )
		  
		  newName = newName.ReplaceAll( "{time}", time )
		  
		  newName = newName.ReplaceAll( "{appID}", getMainBundleIdentifier() )
		  
		  newName = newName.ReplaceAll( "{randomNumber}", getRandomNumber() )
		  
		  newName = newName.ReplaceAll( "{randomAlphaNumeric}", getRandomAlphaNumeric() )
		  
		  newName = newName.ReplaceAll( "{randomUUID}", randomUUID() )
		  
		  newName = newName.ReplaceAll( "{extension}", extension )
		  
		  newName = newName.ReplaceAll( "{seq}", getSequenceNumber() )
		  
		  if exceptionOnError = ExceptionOnErrorFlag.Yes and newName.Contains( "{" ) then
		    
		    raise new RuntimeException( "Possible bad template for temp file name" )
		    
		  end if
		  
		  return newName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getMainBundleIdentifier() As String
		  const AppKit = "AppKit"
		  
		  declare function mainBundle lib AppKit selector "mainBundle" ( NSBundleClass as Ptr ) as Ptr
		  
		  declare function NSClassFromString lib AppKit ( className as CFStringRef ) as Ptr
		  
		  declare function getValue lib AppKit selector "bundleIdentifier" ( NSBundleRef as Ptr ) as CFStringRef
		  
		  var appId as String = getValue( mainBundle( NSClassFromString( "NSBundle" ) ) )
		  
		  return appId
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getRandomAlphaNumeric() As String
		  var s as String = ""
		  
		  while s.Length() < 20
		    
		    var mb as MemoryBlock = Crypto.GenerateRandomBytes( 1 )
		    
		    var i as Integer = mb.UInt8Value( 0 )
		    
		    while ( not ( i >= 65 and i <= 90 ) ) and ( not ( i >= 97 and i <= 122 ) ) and ( not ( i >= 48 and i <= 57 ) )
		      
		      mb = Crypto.GenerateRandomBytes( 1 )
		      
		      i = mb.UInt8Value( 0 )
		      
		    wend
		    
		    s = s + mb.StringValue( 0, 1 )
		    
		  wend
		  
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getRandomNumber() As String
		  static r as Random = new Random()
		  
		  var i as Double = r.InRange( 0, 9223372036854775800 )
		  
		  var uI as Integer = i
		  
		  // System.DebugLog( str( uI ) )
		  
		  return uI.ToString()
		  
		  
		  
		  // var i as Integer = r.InRange( 0, 99999999 )
		  // 
		  // System.DebugLog( str( i ) )
		  // 
		  // return i.ToString()
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getSequenceNumber() As String
		  static seq as UInt64 = 0
		  
		  seq = seq + 1
		  
		  return seq.ToString()
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getSQLDateTimePathSafe() As String
		  return DateTime.Now().SQLDateTime.ReplaceAll( ":", "." )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getUserID() As String
		  var s as Shell = new Shell()
		  
		  s.ExecuteMode = Shell.ExecuteModes.Synchronous
		  
		  s.Execute( "id -u" )
		  
		  var readAll as String = s.ReadAll().Trim()
		  
		  var id as Integer = val( readAll )
		  
		  return id.ToString()
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function getVolume(f as FolderItem) As FolderItem
		  while f.Parent <> nil
		    
		    f = f.Parent
		    
		  wend
		  
		  return f
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub load(byRef data as String, f as FolderItem)
		  var t as TextInputStream = TextInputStream.Open( f )
		  
		  t.Encoding = Encodings.UTF8
		  
		  data = t.ReadAll()
		  
		  t.Close()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function load(f as FolderItem) As Variant
		  var nameAndExtension as Pair = splitFileNameAndExtension( f.Name )
		  
		  var extension as String = nameAndExtension.Right
		  
		  select case extension
		    
		  case "txt"
		    
		    var data as String = ""
		    
		    load( data, f )
		    
		    return data
		    
		  case "json"
		    
		    var data as String = ""
		    
		    load( data, f )
		    
		    var json as JSONItem = new JSONItem( data )
		    
		    return json
		    
		  case "xml"
		    
		    var xml as XMLDocument = new XMLDocument( f )
		    
		    return xml
		    
		  else
		    
		    raise new RuntimeException( "Unknown extension: " + extension + " (in " + f.Name + ")" )
		    
		  end select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub moveToTrash(f as FolderItem)
		  var userTrash as FolderItem = SpecialFolder.Trash()
		  
		  if not onSameVolume( f, userTrash ) then
		    
		    raise new RuntimeException( "Can only move files on system drive to trash" )
		    
		  end if
		  
		  var trashedFileNameTemplate as String = "{fullName}.trashed {date} {time}.{extension}"
		  
		  var trashedFileName as String = expandFileNameTemplate( f, trashedFileNameTemplate, ExceptionOnErrorFlag.Yes )
		  
		  if trashedFileName.Length() > 255 then
		    
		    raise new RuntimeException( "Trashed filename too long" )
		    
		  end if
		  
		  f.Name = trashedFileName
		  
		  f.MoveTo( userTrash )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub moveToTrash(path as String)
		  var f as FolderItem = new FolderItem( path, FolderItem.PathModes.Native )
		  
		  moveToTrash( f )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function onSameVolume(f1 as FolderItem, f2 as FolderItem) As Boolean
		  return getVolume( f1 ).NativePath = getVolume( f2 ).NativePath
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function randomUUID() As String
		  dim result as string = ""
		  
		  soft declare function NSClassFromString lib "Cocoa" ( clsName as cfstringref ) as ptr
		  soft declare function UUID lib "Cocoa" selector "UUID" ( clsRef as ptr ) as ptr
		  soft declare function UUIDString lib "Cocoa" selector "UUIDString" ( obj_id as ptr ) as cfstringref
		  
		  dim classPtr as Ptr = NSClassFromString( "NSUUID" ) 
		  
		  if classPtr <> nil then
		    
		    dim NSUUID as ptr = UUID( classPtr )
		    
		    result = UUIDString( NSUUID )
		    
		  end if
		  
		  return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub safeSave(byRef data as String, f as FolderItem, checkIfExists as CheckIfAlreadyExists, leaveTempFile as LeaveTempFileFlag = LeaveTempFileFlag.No)
		  if checkIfExists = CheckIfAlreadyExists.Yes and f.Exists then
		    
		    // TODO how to best handle this?
		    
		    raise new RuntimeException( "File already exists: " + EndOfLine().Native + f.NativePath )
		    
		  end if
		  
		  // see expandFileNameTemplate for all the options ...
		  
		  var tempFileNameTemplate as String = "{name}-{randomUUID}.{extension}"
		  
		  var tempFileName as String = expandFileNameTemplate( f, tempFileNameTemplate, ExceptionOnErrorFlag.Yes )
		  
		  var enclosingFolder as FolderItem = f.Parent
		  
		  var tempF as FolderItem = enclosingFolder.Child( tempFileName )
		  
		  if tempF.Exists then
		    
		    // TODO delete the file?
		    
		    raise new RuntimeException( "Temp file already exists: " + EndOfLine().Native + tempF.NativePath + EndOfLine().Native + tempFileNameTemplate )
		    
		  end if
		  
		  save( data, tempF, checkIfExists )
		  
		  // TODO check file callback if set
		  
		  if f.Exists then f.Remove()
		  
		  if leaveTempFile = LeaveTempFileFlag.Yes then
		    
		    tempF.CopyTo( f )
		    
		  else
		    
		    tempF.Name = f.Name
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub safeSave(json as JSONItem, f as FolderItem, checkIfExists as CheckIfAlreadyExists, leaveTempFile as LeaveTempFileFlag = LeaveTempFileFlag.No)
		  var data as String = stringify( json )
		  
		  safeSave( data, f, checkIfExists, leaveTempFile )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub safeSave(xml as XMLDocument, f as FolderItem, checkIfExists as CheckIfAlreadyExists, leaveTempFile as LeaveTempFileFlag = LeaveTempFileFlag.No)
		  if checkIfExists = CheckIfAlreadyExists.Yes and f.Exists then
		    
		    // TODO how to best handle this?
		    
		    raise new RuntimeException( "File already exists: " + EndOfLine().Native + f.NativePath )
		    
		  end if
		  
		  // see expandFileNameTemplate for all the options ...
		  
		  var tempFileNameTemplate as String = "{name}-{randomUUID}.{extension}"
		  
		  var tempFileName as String = expandFileNameTemplate( f, tempFileNameTemplate, ExceptionOnErrorFlag.Yes )
		  
		  var enclosingFolder as FolderItem = f.Parent
		  
		  var tempF as FolderItem = enclosingFolder.Child( tempFileName )
		  
		  if tempF.Exists then
		    
		    // TODO delete the file?
		    
		    raise new RuntimeException( "Temp file already exists: " + EndOfLine().Native + tempF.NativePath + EndOfLine().Native + tempFileNameTemplate )
		    
		  end if
		  
		  save( xml, tempF, checkIfExists )
		  
		  // TODO check file callback if set
		  
		  if f.Exists then f.Remove()
		  
		  if leaveTempFile = LeaveTempFileFlag.Yes then
		    
		    tempF.CopyTo( f )
		    
		  else
		    
		    tempF.Name = f.Name
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub save(byRef data as String, f as FolderItem, checkIfExists as CheckIfAlreadyExists = CheckIfAlreadyExists.Yes)
		  if checkIfExists = CheckIfAlreadyExists.Yes then
		    
		    if f.Exists then
		      
		      raise new RuntimeException( "File already exists: " + EndOfLine().Native + f.NativePath )
		      
		    end if
		    
		  end if
		  
		  var output as TextOutputStream = TextOutputStream.Create( f )
		  
		  output.Write( ConvertEncoding( data, Encodings.UTF8 ) )
		  
		  output.Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub save(json as JSONItem, f as FolderItem, checkIfExists as CheckIfAlreadyExists = CheckIfAlreadyExists.Yes)
		  var data as String = stringify( json )
		  
		  save( data, f, checkIfExists )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub save(xml as XMLDocument, f as FolderItem, checkIfExists as CheckIfAlreadyExists = CheckIfAlreadyExists.Yes)
		  if checkIfExists = CheckIfAlreadyExists.Yes then
		    
		    if f.Exists then
		      
		      raise new RuntimeException( "File already exists: " + EndOfLine().Native + f.NativePath )
		      
		    end if
		    
		  end if
		  
		  xml.SaveXML( f )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function splitFileNameAndExtension(name as String) As Pair
		  var components() as String = name.Split( "." )
		  
		  var nameWithNoExtension as String = ""
		  
		  for i as Integer = 0 to components.LastIndex - 1
		    
		    nameWithNoExtension = nameWithNoExtension + components( i ) + "."
		    
		  next
		  
		  nameWithNoExtension = nameWithNoExtension.TrimRight( "." )
		  
		  var extension as String = components( components.LastIndex )
		  
		  return new Pair( nameWithNoExtension, extension )
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function stringify(json as JSONItem) As String
		  var previousCompactSetting as Boolean = json.Compact
		  
		  json.Compact = false
		  
		  var data as String = json.ToString
		  
		  json.Compact = previousCompactSetting
		  
		  return data
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub trash(f as FolderItem)
		  raise new RuntimeException( "Don’t use this method, it’s a work in progress" )
		  
		  #pragma unused f
		  
		  // var userTrash as FolderItem = SpecialFolder.Trash()
		  // 
		  // // var userID as String = getUserID()
		  // 
		  // if onSameVolume( f, userTrash ) then
		  // 
		  // System.DebugLog( userTrash.NativePath )
		  // 
		  // else
		  // 
		  // for i as integer = 0 to FolderItem.LastDriveIndex
		  // 
		  // var volume as FolderItem = FolderItem.DriveAt( i )
		  // 
		  // if not volume.NativePath.BeginsWith( "/Volumes" ) then continue
		  // 
		  // if onSameVolume( f, volume ) then
		  // 
		  // System.DebugLog( volume.NativePath )
		  // 
		  // exit
		  // 
		  // end if
		  // 
		  // // var volumeTrash as FolderItem = new FolderItem( volume.NativePath + "/.Trashes/" + userID, FolderItem.PathModes.Native )
		  // 
		  // // if not volumeTrash.Exists then continue
		  // 
		  // next
		  // 
		  // end if
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub trash(path as String)
		  raise new RuntimeException( "Don’t use this method, it’s a work in progress" )
		  
		  #pragma unused path
		  
		  // var f as FolderItem = new FolderItem( path, FolderItem.PathModes.Native )
		  // 
		  // trash( f )
		  
		  
		End Sub
	#tag EndMethod


	#tag Enum, Name = CheckIfAlreadyExists, Type = Integer, Flags = &h1
		Yes
		No
	#tag EndEnum

	#tag Enum, Name = ExceptionOnErrorFlag, Type = Integer, Flags = &h1
		Yes
		No
	#tag EndEnum

	#tag Enum, Name = LeaveTempFileFlag, Flags = &h1
		Yes
		No
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
