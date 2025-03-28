#tag Class
Class AttributedString
Inherits NSAttributedString
	#tag Method, Flags = &h0
		Sub Constructor(fromNSAttributedString as NSAttributedString)
		  //# Create an AttributedString from its Cocoa counterpart
		  
		  #if TargetMacOS
		    if Cocoa.InheritsFromClass( fromNSAttributedString, "NSMutableAttributedString" ) then
		      m_Mutable = true
		    end if
		    
		    self.Constructor(fromNSAttributedString.id)
		    NSbacking = fromNSAttributedString
		    selection = Cocoa.NSMakeRange( 0, 0 )
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromHTML(HTMLdata as NSData, baseURL as NSURL = nil) As AttributedString
		  
		  #if TargetMacOS
		    dim nsas as NSAttributedString = NSAttributedString.CreateFromHTML( HTMLData, baseURL )
		    
		    if nsas<>nil then
		      return   new AttributedString( nsas )
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function CreateFromRTF(RTFdata as NSData) As AttributedString
		  #if TargetMacOS
		    dim nsas as NSAttributedString = NSAttributedString.CreateFromRTF( RTFData )
		    
		    if nsas<>nil then
		      return   new AttributedString( nsas )
		    end if
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length() As integer
		  //# Return the length of the AttributedString
		  
		  #if TargetMacOS
		    return  NSbacking.Length
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mid(startPosition as integer, length as integer = - 1) As AttributedString
		  //# Return the attributed substring in the given range
		  
		  //@ The startPosition must be in the range 1 to Length()
		  //@ If the length is omitted or negative, the full string starting at 'startPosition' is returned
		  
		  #if TargetMacOS
		    dim nsas as NSAttributedString
		    dim realrange as Cocoa.NSRange
		    
		    if startPosition<1 OR startPosition>me.Length then
		      raise   new OutOfBoundsException
		    else
		      realrange.location = startPosition - 1
		    end if
		    
		    if (startPosition + length) > me.Length OR length<0 then //Auto-adjust length
		      realrange.length = me.length - realrange.location
		    else
		      realrange.length = length
		    end if
		    
		    nsas = NSbacking.AttributedSubstringFromRange( realrange )
		    
		    return  new AttributedString( nsas )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(aString as AttributedString) As AttributedString
		  //# Allows two AttributedStrings to be concatenated using the "+" operator
		  
		  #if TargetMacOS
		    dim ns2 as NSAttributedString
		    
		    ns2 = NSbacking + aString.NSbacking
		    
		    return  new AttributedString( ns2 )
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As string
		  //# Return the raw contents of the AttributedString without the attributes
		  
		  #if TargetMacOS
		    return  NSbacking.StringValue
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			//# The underlying NSAttributedString handle (same as "id" )
		#tag EndNote
		#tag Getter
			Get
			  //# Handle of the object
			  
			  return Integer(self.id)
			End Get
		#tag EndGetter
		Handle As integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  m_Mutable
			End Get
		#tag EndGetter
		Mutable As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private m_Mutable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NSbacking As NSAttributedString
	#tag EndProperty

	#tag Property, Flags = &h21
		Private selection As Cocoa.NSRange
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    return   selection.length
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    selection.length = value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private SelLength As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  
			  #if TargetMacOS
			    return   selection.location
			  #endif
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  #if TargetMacOS
			    selection.location = value
			  #else
			    #pragma unused value
			  #endif
			End Set
		#tag EndSetter
		Private SelStart As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StringValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Length"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt32"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mutable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
