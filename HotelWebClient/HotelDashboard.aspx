<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelDashboard.aspx.cs" Inherits="HotelWebClient.HotelDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
      .navi{background-color:darkseagreen;padding:20px;}
        .navi label {
                padding:20px;
                margin-left: 50px;
                margin-right:180px;
                font-size: 35px;

        }
         .navi b label{font-size:18px;}
        .navi ul{margin-left:250px;}
        .navi ul li{
                padding:5px;
                border-style: inset;
                list-style: none;
                display: inline-flex;
                width:auto;
	            margin-left:80px;
                font-size: 22px;
        }.navi ul li a{text-decoration:none;
                       color:black
         }
            .navi ul li:hover {
                background: #A7A4A4;
                border-style: solid;
                background-color: black;
                color: white;
            }
        
.table5 tr td{font-size:22px;}                       
    </style>
    <script src="JavaScript.js"></script>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
        <div class="navi">
            <nav>
                <label>Debi Hotel dashboard</label><br />
                <br />
                <b><asp:Label ID="HotelID" runat="server" Text=""></asp:Label></b>  <br />
                <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" CellPadding="2" >
            <ItemTemplate>
                  <div class="table5">
                <table class="table">                    
                      <tr>  <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>' ></asp:Label></td></tr>
                     <tr>   <td> <asp:Label ID="Label2" runat="server" Text='<%#Eval("Country") %>' ></asp:Label></td> </tr>                                                                         
                 </table>
               </div>
            </ItemTemplate>
            </asp:DataList><br />
                <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
                
                <ul>              
                <li><a href="ShowMyHotel.aspx">Hotel details</a> </li>
                <li><a href="Rooms.aspx"> Room Details</a></li>
                 <li><a href="MyHotelBooking.aspx"> Booking</a></li>                                                
                 </ul>
            </nav>
        </div>    </form>
</body>
</html>

