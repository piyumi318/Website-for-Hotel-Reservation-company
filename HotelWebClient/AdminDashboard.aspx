<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HotelWebClient.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
      .navi{background-color:gainsboro;padding:20px; border:inset; }
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
                width:130px;
	            margin-left:80px;
                font-size: 22px;
        }.navi ul li a{text-decoration:none}
            .navi ul li:hover {
                background: #A7A4A4;
                border-style: solid;
                background-color: black;
                color: white;
            }
            
                          
    </style>
    <script src="JavaScript.js"></script>
</head>
<body>
    <header></header>
    <form id="form1" runat="server">
        <div class="navi">
            <nav>
                <label>Debi Hotel dashboard</label><br />
                 <b><asp:Label ID="Label1" runat="server" Text="Admin ID"></asp:Label></b>  <br />
                 <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
                <ul>
                    
                <li><a href="ManageAllHotels.aspx">Hotels</a></li>
                <li><a href="HotelReg.aspx">Add Hotel</a></li>
                <li><a href="AdminReg.aspx"> Add Admin </a></li>
              <li><a href="AllBookingDetails.aspx">Booking</a></li>
                 </ul>
            </nav>
        </div>    

    </form>
</body>
</html>
