<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelLogin.aspx.cs" Inherits="HotelWebClient.HotelLogin" %>

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
        #formHotelLogin{margin-left:450px;
                        padding:20px;
                        border:outset;
                        width:600px;
                        height:auto;
                          background-color:white;
        } body{ background-color:darkgrey;}
        table tr{margin-bottom:30px;}
        h4{ font-size:28px;}
       
        .auto-style2 {
            width: 119px;
            height: 39px;
        }
        .auto-style3 {
            height: 62px;
        }
        .auto-style4 {
            width: 120px;
            height: 62px;
        }
        .auto-style5 {
            height: 61px;
        }
        .auto-style6 {
            width: 619px;
            height: 40px;
        }
        .auto-style7 {
            width: 120px;
            height: 61px;
        }
       
        .auto-style8 {
            width: 120px;
        }  header, form{margin:30px;}
       
    </style>
</head>
    
<body>
      <header></header>
    
    <form id="formHotelLogin" runat="server">
        <h4>My Hotel Login</h4>
        <div> <table class="auto-style6">
   
        <tr> <td class="auto-style4"><asp:Label ID="UnameLbl" runat="server" Text="Username"></asp:Label></td>
        <td class="auto-style3"> <asp:TextBox ID="hotelUname" runat="server" Height="29px" Width="245px"></asp:TextBox></td> 
         <td class="auto-style3">
         <asp:RequiredFieldValidator ID="RVFUsername" runat="server"
             ErrorMessage="Username Must be entered" ControlToValidate="hotelUname"
             ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
         </tr>
 <tr>
          <td class="auto-style7"> <asp:Label ID="PwordLbl" runat="server" Text="Password"></asp:Label></td>
         <td class="auto-style5"><asp:TextBox ID="hotelPword" runat="server" Height="29px" Width="249px" TextMode="Password"></asp:TextBox></td>
        <td class="auto-style5">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
             ErrorMessage="Password Must be entered" ControlToValidate="hotelPword" 
             ForeColor="#FF3300"></asp:RequiredFieldValidator></td>   

 </tr>
   <tr>
       <td class="auto-style8"></td>
           <td class="auto-style2"> <asp:Button ID="Loginbtn" runat="server" Text="Login" 
               Height="29px" Width="268px" OnClick="Loginbtn_Click" /> </td> 

   </tr>
  </table>
            <a href="AdminLogin.aspx">Login as Admin</a>
        </div>
        
    </form>
</body>
</html>
