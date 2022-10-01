<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelsRooms.aspx.cs" Inherits="HotelWebClient.HotelsRooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script>
    fetch("./AdminDashboard.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });</script>
           
     <style>
        .table1 {margin-left:100px;
                 border:inset;
        
        }
  </style>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
         <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" CellPadding="2" >
            <ItemTemplate>
                  <div class="table1">
                         
                <table >
                      <tr><td>  <asp:Image ID="Image1" runat="server" Height="250px" Width="350px" ImageUrl='<%#Eval("Image")%>'/></td></tr>  
                    <tr>
                        <td>Room ID <asp:Label ID="Label1" runat="server" Text='<%#Eval("RoomId") %>' ></asp:Label></td></tr>  
                       
                        <tr> <td>Hotel ID: <asp:Label ID="Label2" runat="server" Text='<%# Eval("HotelId") %>'></asp:Label></td> </tr>
                     <tr><td>Room Size:<asp:Label ID="roomsize" runat="server" Text='<%#Eval("RoomSize") %>' ></asp:Label></td>  </tr>
                    <tr> <td>Price: $<asp:Label ID="price" runat="server" Text='<%#Eval("Price") %>' ></asp:Label></td></tr>
                     <tr> <td>Quantity<%#Eval("Quantity") %></td> </tr>
                     <tr> <td>Room type:<%#Eval("Roomtype") %></td>  </tr>         
                </table>
                        </div>
            </ItemTemplate>
                </asp:DataList>
    </form>
    
</body>
</html>
