<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomsOfHotel.aspx.cs" Inherits="HotelWebClient.RoomsOfHotel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
     <script>
         fetch("./DebiNavigationBar.aspx")
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
        #Label5{font-size:25px;
                margin-left:350px;
        }
  </style>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
       
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="filter" 
            Text="Show all Rooms" AutoPostBack="true" OnCheckedChanged="RadioButton3_CheckedChanged"  />
      <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <div>
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="filter"
                Text="Room Type" AutoPostBack="true" OnCheckedChanged="RadioButton1_CheckedChanged"  />
          <asp:DropDownList ID="Roomtypes" runat="server" >
            <asp:ListItem>Standard</asp:ListItem>
            <asp:ListItem>Deluxe</asp:ListItem>
            <asp:ListItem>Suite</asp:ListItem>
           
            </asp:DropDownList></div>
    <div>
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="filter"
                Text="Price Range" AutoPostBack="true" OnCheckedChanged="RadioButton2_CheckedChanged"/>
            <asp:DropDownList ID="Price" runat="server" >
            <asp:ListItem>10-20 </asp:ListItem>
            <asp:ListItem>20-30</asp:ListItem>
            <asp:ListItem>30-40</asp:ListItem>
            <asp:ListItem>40-50</asp:ListItem>
                <asp:ListItem>50-60</asp:ListItem>
                <asp:ListItem>60-70</asp:ListItem>
                <asp:ListItem>70-100</asp:ListItem>
               
            <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
             <asp:Button ID="BtnFillter" runat="server" Text="Filter" OnClick="BtnFillter_Click" />
        </div>
       
         <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" CellPadding="2" OnItemCommand="DataList2_ItemCommand">
            <ItemTemplate>
                  <div class="table1">
                         
                <table >
                      <tr><td>  <asp:Image ID="Image1" runat="server" Height="250px" Width="350px" ImageUrl='<%#Eval("Image")%>'/></td></tr>  
                    <tr>
                        <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("Roomtype") %>' ></asp:Label></td>
                        <td>  <asp:HiddenField ID="RoomId" runat="server" Value='<%# Eval("RoomId") %>' /></td>
                         <td>  <asp:HiddenField ID="HotelId" runat="server" Value='<%# Eval("HotelId") %>' /></td>
                    </tr>
                    <tr><td><asp:Label ID="roomsize" runat="server" Text='<%#Eval("RoomSize") %>' ></asp:Label></td>  </tr>
                    <tr> <td><asp:Label ID="price" runat="server" Text='<%#Eval("Price") %>' ></asp:Label></td></tr>
                     <tr> <td><%#Eval("Quantity") %></td> </tr>
                     <tr> <td><%#Eval("Roomtype") %></td>  </tr>
                      <tr><td><asp:Label ID="Label3" runat="server" Text="CheckIn"></asp:Label> 
                         <asp:TextBox ID="txtCheckIn" runat="server" TextMode="date"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Text="CheckOut"></asp:Label>
                         <asp:TextBox ID="txtCheckOut" runat="server" TextMode="date"></asp:TextBox></td> </tr>
                   <tr><td><asp:linkbutton id="Linkbutton1" runat="server" commandname="Check" text="Check Avalibility" ></asp:linkbutton></td></tr>
                       <tr><td><asp:TextBox ID="quantity" runat="server" TextMode="Number"></asp:TextBox></td></tr>
                         <tr><td><asp:linkbutton id="Linkbutton2" runat="server" commandname="Book" text="Book" ></asp:linkbutton></td></tr>
                </table>
                        </div>
            </ItemTemplate>
                </asp:DataList>
    </form>
    
</body>
</html>
   
