<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="HotelWebClient.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>fetch("./DebiNavigationBar.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });</script>
    <style type="text/css">
        .auto-style1 {
            height: 33px;
        }
            #formAdminLogin{margin-left:450px;
                        padding:20px;
                        border:outset;
                        width:560px;
                        height:auto;
                          background-color:white;
        } body{ background-color:darkgrey;}
        table tr{margin-bottom:30px;}
        h3{ font-size:28px;}

        
        .auto-style3 {
            margin-left: 5px;
        }
        .auto-style4 {
            width: 104px;
            height: 47px;
        }
        .auto-style5 {
            height: 33px;
            width: 104px;
        }
        .auto-style6 {
            width: 544px;
            height: 175px;
        }
        .auto-style7 {
            height: 53px;
        }
        .auto-style8 {
            width: 104px;
            height: 53px;
        }
        .auto-style9 {
            height: 47px;
        }
        .auto-style10 {
            width: 204px;
        }
        header, form{margin:30px;}
    </style>
</head>
<body>
      <header></header>
   
    <form id="formAdminLogin" runat="server">
         <h3>Admin Login</h3>
        <div> <table class="auto-style6">
     <tr>
         <td class="auto-style8"><asp:Label ID="UnameLbl" runat="server" Text="Username"></asp:Label></td>
        <td class="auto-style7"> <asp:TextBox ID="Uname" runat="server" Height="29px"
            Width="244px" CssClass="auto-style3"></asp:TextBox></td>  
         <td class="auto-style10"><asp:RequiredFieldValidator ID="RVFUsername" runat="server"
             ErrorMessage="Username Must be entered" ControlToValidate="Uname" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
       
         </tr>
 <tr>
          <td class="auto-style4"> <asp:Label ID="PwordLbl" runat="server" Text="Password"></asp:Label></td>
         <td class="auto-style9"><asp:TextBox ID="Pword" runat="server" Height="29px" Width="242px" 
             TextMode="Password" CssClass="auto-style3"></asp:TextBox></td>
        <td class="auto-style10"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Password Must be entered" ControlToValidate="Pword" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>   

 </tr>
   <tr>
       <td class="auto-style5"></td>
           <td class="auto-style1"> <asp:Button ID="Loginbtn" runat="server" Text="Login" Height="34px" 
               Width="258px" OnClick="Loginbtn_Click" /> </td> 

   </tr>
  </table>
        </div>
        
    </form>
</body>
</html>

