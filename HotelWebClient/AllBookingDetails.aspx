<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllBookingDetails.aspx.cs" Inherits="HotelWebClient.AllBookingDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script>  fetch("./AdminDashboard.aspx")
              .then(response => {
                  return response.text()
              })
              .then(data => {
                  document.querySelector("header").innerHTML = data;
              });

      </script>
    <style> 
.table1{border:inset;width:400px;
height:auto;
margin-left:200px;
    
 }
    </style>
  
</head>
    
<body>
    <header></header>
    <form id="form1" runat="server">
        <h3>Booking Details</h3>
          <div class="BookingDetails">
             
        <asp:DataList ID="BookingDetails" runat="server" RepeatColumns="2" CellPadding="2" OnItemCommand="My_ItemCommand">
            <ItemTemplate>
                  <div class="table1">
                <table>
            <tr><td><h3>Booking Id:</h3></td>
                    <td>    <asp:Label ID="bookingId" runat="server" Text='<%#Eval("BookingId")%>'></asp:Label></td></tr>
                        <tr>
                        <td>Name: <asp:Label ID="Label1" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                        <asp:Label ID="roomsize" runat="server" Text='<%#Eval("LastName") %>'> </asp:Label></td> </tr>
                 <tr><td>Address:<asp:Label ID="price" runat="server" Text='<%#Eval("Address") %>' Textmode="multiline" ></asp:Label></td></tr> 
                    <tr><td>Country: <asp:Label ID="Label2" runat="server" Text='<%#Eval("Country") %>'></asp:Label></td>  </tr>
                    <tr><td>Email: <asp:Label ID="Label3" runat="server" Text='<%#Eval("Email") %>'  ></asp:Label></td> </tr>
                  <tr> <td>Mobile: <asp:Label ID="Label5" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label></td>  </tr>
                    <tr><td><h3>check In</h3><asp:Label ID="Label7" runat="server" Text='<%#Eval("Checkin") %>' ></asp:Label></td>
               <td><h3>Check Out</h3><asp:Label ID="Label8" runat="server" Text='<%#Eval("Checkout") %>'></asp:Label></td>  </tr>  
              <tr><td><asp:linkbutton id="Linkbutton1" runat="server" commandname="Check" text="Show booked hotel and room"  ></asp:linkbutton></td>
                       <td><asp:linkbutton id="Linkbutton2" runat="server" commandname="Cancel" text="Cancel Booking"  ></asp:linkbutton></td></tr>
                    <tr>  <td>  <asp:HiddenField ID="RoomId" runat="server" Value='<%# Eval("RoomId") %>' /></td>
                       <td>   <asp:HiddenField ID="HotelId" runat="server" Value='<%# Eval("HotelId") %>' /></td>  
                         <td>   <asp:HiddenField ID="CusID" runat="server" Value='<%# Eval("CustomerId") %>' /></td> 
                    </tr>
                   </table> 
               
                        </div>
            </ItemTemplate>
                </asp:DataList>

        </div>
    </form>
</body>
</html>
