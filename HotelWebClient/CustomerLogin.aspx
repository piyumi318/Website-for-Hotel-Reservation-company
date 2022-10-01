<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="HotelWebClient.CustomerLogin" %>

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
    <style>
        form{margin:20px;}
#formCustomerLogin{margin-left:450px;
                        padding:20px;
                        border:outset;
                        width:650px;
                        height:auto;
                          background-color:white;
        } body{ background-color:darkgray;}
        table tr{margin-bottom:30px;}
        h4{ font-size:28px;}
        .auto-style1 {
            height: 69px;
            width: 115px;
        }
        .auto-style2 {
            height: 39px;
            width: 326px;
        }
        .auto-style3 {
            height: 56px;
            width: 115px;
        }
        .auto-style4 {
            height: 69px;
            width: 326px;
        }
        .auto-style5 {
            height: 56px;
            width: 326px;
        }
        .auto-style7 {
            width: 115px;
        }
        .auto-style8 {
            width: 626px;
            height: 202px;
        }
        .auto-style9 {
            width: 239px;
        }
        #Loginbtn{
padding:10px;
background-color:black;
color:white;}
    </style>
</head>
<body>
    
      <header></header>
   
    <form id="formCustomerLogin" runat="server" class="auto-style8">
        <div> <h4>Customer Login</h4> <table>
     <tr>      
         <td class="auto-style1"><asp:Label ID="UnameLbl" runat="server" Text="Username"></asp:Label></td>
        <td class="auto-style4"> <asp:TextBox ID="customerUname" runat="server" Height="29px" Width="295px"></asp:TextBox></td>  
    <td class="auto-style9"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
        ErrorMessage="Username Must Entered" ControlToValidate="customerUname" ForeColor="Red"></asp:RequiredFieldValidator></td>
      </tr>
 <tr>
          <td class="auto-style3"> <asp:Label ID="PwordLbl" runat="server" Text="Password"></asp:Label></td>
         <td class="auto-style5"><asp:TextBox ID="customerPword" runat="server" Height="29px" Width="294px"
             TextMode="Password"></asp:TextBox></td>
       <td class="auto-style9"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
           ErrorMessage="Password Must Entered" ControlToValidate="customerPword" ForeColor="Red"></asp:RequiredFieldValidator></td>

 </tr>
   <tr>
       <td class="auto-style7"></td>
           <td class="auto-style2"> <asp:Button ID="Loginbtn" runat="server" Text="Login" 
               Height="43px" Width="298px" OnClick="Loginbtn_Click" /> </td> 
         </tr>
            
            <tr><td class="auto-style7"><a href="CustomerRegaspx.aspx">Register</a></td></tr>
  </table>
        </div>
        
    </form>
</body>
</html>
