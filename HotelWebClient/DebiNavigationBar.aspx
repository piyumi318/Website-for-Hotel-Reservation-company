<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DebiNavigationBar.aspx.cs" Inherits="HotelWebClient.DebiNavigationBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
  <style>
      .navi{background-color:cornflowerblue;padding:20px;}
        .navi label {
                padding:20px;
                margin-left: 50px;
                margin-right:150px;
                font-size: 35px;

        }ul li a{text-decoration:none;
       color:black;
}
         .navi b label{font-size:18px;}
        .navi ul{ margin-left: 50px;}
        .navi ul li{
                padding:10px;
                border-style: inset;
                list-style: none;
                display: inline-flex;
                width:auto;
	            margin-left:80px;
                font-size: 22px;
        } 
            .navi ul li:hover {
               
                border-style:solid;
                background-color:ghostwhite;
                color:white;
            }             
    </style>
    <script src="JavaScript.js"></script>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
        <div class="navi">
            <nav>
                <label>Debi</label><br />
                 <b><label>Hotel room resavation company</label></b>  <br />
                <b>
                <asp:Label ID="Label1" runat="server" Text="qqq"></asp:Label></b>
                  <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" CellPadding="2" >
                 <ItemTemplate>
                 
                   <h3><%#Eval("FirstName") %> <%#Eval("LastName") %></h3></tr>
                      <h3> <asp:Label ID="Label3" runat="server" Text='<%#Eval("Email") %>' ></asp:Label></h3> </tr>                                                     
            </ItemTemplate>
                </asp:DataList><br /><br />

                <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
                <ul>
                <li><a href="ShowHotelDetails.aspx">Hotels</a></li>
                <li><a href="ShowRoomDetails.aspx">Rooms</a></li>           
                 <li><a href="CustomerLogin.aspx">Sing in/up</a></li>
                 <li><a href="MyBooking.aspx">My Booking</a></li>
                 <li><a href="HotelLogin.aspx">My Hotel</a></li>
                 </ul>
            </nav>
        </div>
        <div><b> <asp:Label ID="Response" runat="server" Text=""></asp:Label></b></div>
    </form>
</body>
</html>
