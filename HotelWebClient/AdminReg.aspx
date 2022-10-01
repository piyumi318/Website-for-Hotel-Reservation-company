<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReg.aspx.cs" Inherits="HotelWebClient.AdminReg" %>

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
            });</script>
    <style type="text/css">
        .auto-style1 {
            margin-left: 161px;
        }#formAdminReg{margin-left:450px;
                        padding:20px;
                        border:outset;
                        width:560px;
                        height:auto;
                          background-color:white;
        } body{ background-color:darkgrey;}
        table tr{margin-bottom:30px;}
        .auto-style2 {
            height: 60px;
        }
        .auto-style3 {
            height: 52px;
        }
        .auto-style4 {
            height: 56px;
        }
        .auto-style5 {
            height: 60px;
            width: 145px;
        }
        .auto-style6 {
            height: 52px;
            width: 145px;
        }
        .auto-style7 {
            height: 56px;
            width: 145px;
        }
         h3{ font-size:28px;}

        
        header, form{margin:30px;}
    </style>
</head>
<body>
    <header></header>
    <form id="formAdminReg" runat="server">
     <div><h3>Admin Registration</h3>
         <table>
                <tr>
         <td class="auto-style5" ><asp:Label ID="Label3" runat="server" Text="Username"></asp:Label></td>
        <td class="auto-style2" > <asp:TextBox ID="TxtUsername" runat="server" Height="29px" Width="222px"></asp:TextBox></td> 
                    <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Username Must be entered" ControlToValidate="TxtUsername"
                        ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
         </tr>
 <tr>
          <td class="auto-style6" > <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label></td>
         <td class="auto-style3" ><asp:TextBox ID="TxtPass" runat="server" Height="29px" Width="222px" TextMode="Password"></asp:TextBox></td>
         <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="Password Must be entered" ControlToValidate="TxtPass"
                        ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
  </tr>
        <tr>
          <td class="auto-style7" > <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label></td>
         <td class="auto-style4" ><asp:TextBox ID="TxtCpass" runat="server" Height="29px" Width="222px" TextMode="Password"></asp:TextBox></td>
         <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="Password Must be entered" ControlToValidate="TxtCpass" 
                        ForeColor="#FF3300"></asp:RequiredFieldValidator></td> </tr>
         </table>
         </div>     <br />
         <asp:Button ID="btnreg" runat="server" Text="Register" Width="260px" CssClass="auto-style1" OnClick="btnreg_Click" Height="38px"  />
    </form>
</body>
</html>
