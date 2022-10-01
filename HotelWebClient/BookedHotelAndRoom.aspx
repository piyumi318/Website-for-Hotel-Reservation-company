<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookedHotelAndRoom.aspx.cs" Inherits="HotelWebClient.BookedHotelAndRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <style>
       
         .table1 {margin-left:150px;
                 border:inset;
        }
    </style>
</head>
<body> 
    <form id="form1" runat="server">       
<h2>Booked Hotel details</h2>
        <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" />
        <div >
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" CellPadding="2">
            <ItemTemplate>
                  <div class="table1">
                <table >
                      <tr><td>  <asp:Image ID="Image1" runat="server" Height="250px"
                          Width="300px" ImageUrl='<%#Eval("Image")%>'/></td></tr>  
                    <tr> <td>Hotel Name: <asp:Label ID="Label1" runat="server"
                        Text='<%#Eval("Name") %>' ></asp:Label></td></tr>
                      <tr>  <td>Description:<asp:Label ID="labeldescription" runat="server" 
                          Text='<%#Eval("Description") %>' ></asp:Label></td> </tr> 
                        <tr> <td>No. <%#Eval("No") %></td> </tr>
                        <tr> <td>City: <%#Eval("City") %></td> </tr>
                        <tr> <td>Country: <%#Eval("Country") %></td> </tr>
                       <tr>  <td>Mobile: <%#Eval("Mobile") %></td> </tr>                 
                        <tr> <td>Email: <%#Eval("Email") %></td> </tr>
               </table>
            </div>
       </ItemTemplate>
    </asp:DataList>
        </div>
        <h2>Booked HotelRoom Details</h2>
         <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" CellPadding="5" >
            <ItemTemplate>
                  <div class="table1">                         
                <table >
                      <tr><td>  <asp:Image ID="Image1" runat="server" Height="250px" Width="300px" ImageUrl='<%#Eval("Image")%>'/></td></tr>  
                    <tr><td>Room Id: <asp:Label ID="Label2" runat="server" Text='<%#Eval("RoomId") %>' ></asp:Label></td></tr>
                    <tr>
                       
                        <td>Room Type: <asp:Label ID="Label1" runat="server" Text='<%#Eval("Roomtype") %>' ></asp:Label></td>
                        <td>  <asp:HiddenField ID="RoomId" runat="server" Value='<%# Eval("RoomId") %>' /></td>
                         <td>  <asp:HiddenField ID="HotelId" runat="server" Value='<%# Eval("HotelId") %>' /></td>
                    </tr>
                    <tr><td>Room Size: <asp:Label ID="roomsize" runat="server" Text='<%#Eval("RoomSize") %>' ></asp:Label></td> </tr>
                    <tr>
                        <td>Price: $ <asp:Label ID="price" runat="server" Text='<%#Eval("Price") %>' ></asp:Label></td>    </tr>
                      <tr><td>Quantity: <%#Eval("Quantity") %></td></tr>
                </table>
                        </div>
            </ItemTemplate>
                </asp:DataList>
          <h2>Customer Details Who Made Booking</h2>
         <asp:DataList ID="DataList3" runat="server" RepeatColumns="1" CellPadding="2">
            <ItemTemplate>
                  <div class="table1">
                <table >
                      
                    <tr> <td>Hotel Name: <asp:Label ID="Label1" runat="server"
                        Text='<%#Eval("FirstName") %>' ></asp:Label> <asp:Label ID="Label3" runat="server"
                        Text='<%#Eval("LastName") %>' ></asp:Label></td></tr>
                      <tr>  <td>Description:<asp:Label ID="labeldescription" runat="server" 
                          Text='<%#Eval("Address") %>' ></asp:Label></td> </tr> 
                        <tr> <td>No. <%#Eval("Gender") %></td> </tr>
                        <tr> <td>City: <%#Eval("Bday") %></td> </tr>
                        
                       <tr>  <td>Mobile: <%#Eval("Mobile") %></td> </tr>                 
                        <tr> <td>Email: <%#Eval("Email") %></td> </tr>
               </table>
            </div>
       </ItemTemplate>
    </asp:DataList>
    </form>    
</body>
</html>

     
 