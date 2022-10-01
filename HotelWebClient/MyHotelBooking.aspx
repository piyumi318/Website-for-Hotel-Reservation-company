<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyHotelBooking.aspx.cs" Inherits="HotelWebClient.MyHotelBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script> fetch("./HotelDashboard.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });
    </script>
  <style>
        .table1 {margin-left:200px;
                 border:inset;}
</style>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
<asp:DataList ID="Mybooking1" runat="server" RepeatColumns="3" CellPadding="2" OnItemCommand="My_ItemCommand">
            <ItemTemplate>
                  <div class="table1">
                <table>
                    <tr><td>Booking Details</td></tr>
                     <tr><td> <asp:Label ID="bookingId" runat="server" Text='<%#Eval("BookingId")%>'></asp:Label> </td></tr>
                        <tr><td><h3>Name</h3><asp:Label ID="Label1" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label></td>
                        <td><asp:Label ID="roomsize" runat="server" Text='<%#Eval("LastName") %>'> </asp:Label></td></tr>
                        <tr><td><h4>Address</h4><asp:Label ID="price" runat="server" Text='<%#Eval("Address") %>'
                            Textmode="multiline" ></asp:Label></td>
                      <td><h4>Country</h4><asp:Label ID="Label2" runat="server" Text='<%#Eval("Country") %>'></asp:Label></td>  </tr>  
                    <tr> <td><h4>Email</h4><asp:Label ID="Label3" runat="server" Text='<%#Eval("Email") %>'  ></asp:Label></td>
                      <td><h4>Mobile</h4><asp:Label ID="Label5" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label></td>   </tr>
                        <tr><td><h4>Check In</h4><asp:Label ID="Label7" runat="server" Text='<%#Eval("Checkin") %>' ></asp:Label></td>
                      <td><h4>CheckOut</h4><asp:Label ID="Label8" runat="server" Text='<%#Eval("Checkout") %>'></asp:Label></td> </tr> 
                     <tr><td><asp:linkbutton id="Linkbutton1" runat="server" commandname="Check" 
                         text="Show Booked hotel and Room"  ></asp:linkbutton></td>
                        <tr><td><asp:HiddenField ID="RoomId" runat="server" Value='<%# Eval("RoomId") %>' /></td>
                       <td>  <asp:HiddenField ID="HotelId" runat="server" Value='<%# Eval("HotelId") %>' /></td>
                            <td>   <asp:HiddenField ID="CusID" runat="server" Value='<%# Eval("CustomerId") %>' /></td>
                        </tr>
                        </table> 
               
                        </div>
            </ItemTemplate>
                </asp:DataList>
            </form>
</body>
</html>