<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegaspx.aspx.cs" Inherits="HotelWebClient.CustomerRegaspx" %>

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
          body{background-color:aliceblue;}
          .table1, .table2 {
              display: inline-block;
              
          }
        #btnreg{margin-left:480px;
                width:220px;
                
                padding:10px;
                background-color:black;
                color:white;
        }
       table{border:inset;
          background-color:white; 
       }
       .table1{width:650px;
              
               margin:10px;
       }
          .auto-style3 {
              width: 152px;
              height: 38px;
          }
          .auto-style4 {
              height: 38px;
              width: 223px;
          }
          .auto-style5 {
              display: inline-block;
              margin-right: 0px;
          }
          .auto-style6 {
              width: 280px;
          }
          .Logindetails{margin-bottom:200px; margin-left:40px;
                            width:600px;
            height:auto;}
          #Label1{font-size:25px;}
          .auto-style7 {
              margin-left: 243px;
          }
          .auto-style8 {
              width: 152px;
          }
          .auto-style9 {
              display: inline-block;
              margin-right: 0px;
              width: 623px;
          }
          .auto-style10 {
              width: 134px;
          }
          .auto-style12 {
              width: 134px;
              height: 48px;
          }
          .auto-style13 {
              width: 280px;
              height: 48px;
          }
          .auto-style14 {
              width: 223px;
          }
          .auto-style15 {
              margin-bottom: 200px;
              margin-left: 40px;
              width: 616px;
              height: 159px;
          }
    </style>
</head>
<body>

    <header></header>
     
    <form id="form1" runat="server">
     <b> <asp:Label ID="Label1" runat="server" Text="Customer Registration"></asp:Label><br /></b> 
        <div class="table1">
        
            <table class="auto-style9">
              <tr>
                  <td class="auto-style10" ><h3>Personal details</h3></td>

              </tr>
    <tr>
        <td class="auto-style10" ><h3>First Name</h3></td>
        <td class="auto-style6" ><asp:TextBox ID="txtFName" runat="server" style="margin-left: 0px" Width="275px"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ErrorMessage="please enter Firstname" ControlToValidate="txtFName" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
      
    </tr>
    <tr>
        <td class="auto-style10" ><h3>Last Name</h3></td>
        <td class="auto-style6" ><asp:TextBox ID="TxtLName" runat="server" style="margin-left: 0px" Width="275px"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
             ErrorMessage="please enter Lasttname" ControlToValidate="TxtLName" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
    </tr>
    <tr>
        <td class="auto-style12"><h3>Address</h3></td>
        <td class="auto-style13" ><asp:TextBox ID="txtAddress" runat="server" style="margin-left: 0px" Width="275px" 
            TextMode="MultiLine"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
             ErrorMessage="please enter Address" ControlToValidate="txtAddress" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
            
            
    </tr>
            <tr><td class="auto-style10"><h3>Gender</h3></td>
        <td class="auto-style6"><asp:RadioButton ID="rbmale" GroupName="radio" runat="server" Text="Male" Checked="true" />
            <asp:RadioButton ID="rbfmale" GroupName="radio" runat="server" text="Fmale"/>
        </td>
        </tr>
           <tr>
        <td class="auto-style10"><h3>Birthday</h3></td>
        <td class="auto-style6" ><asp:TextBox ID="txtBday" runat="server" style="margin-left: 0px" Width="275px" 
            TextMode="Date"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
             ErrorMessage="please select Birthday" ControlToValidate="txtBday" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
          </tr>
            
    <tr>
        <td class="auto-style10"><h3>Mobile</h3></td>
        <td class="auto-style6" ><asp:TextBox ID="txtMobile" runat="server" style="margin-left: 0px" Width="275px" 
            TextMode="SingleLine"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
             ErrorMessage="please enter Mobile" ControlToValidate="txtMobile" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
    </tr>
            <tr>
        <td class="auto-style10"><h3>Email</h3></td>
        <td class="auto-style6" ><asp:TextBox ID="txtEmail" runat="server" style="margin-left: 0px" Width="275px" 
            TextMode="SingleLine"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
             ErrorMessage="please enter Email" ControlToValidate="txtEmail" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
    </tr>

       </table>
            </div>
        <div class="auto-style5">
    <div class="auto-style15">
       <table> 
            <tr>
                  <td class="auto-style8" ><h3>Login details</h3></td>

              </tr>
        <tr>
         <td class="auto-style3" ><asp:Label ID="Label3" runat="server" Text="Username"></asp:Label></td>
        <td class="auto-style4" > <asp:TextBox ID="TxtUsername" runat="server" Height="27px" Width="222px"></asp:TextBox></td>  
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
             ErrorMessage="please enter username" ControlToValidate="TxtUsername" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
         </tr>
 <tr>
          <td class="auto-style8" > <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label></td>
         <td class="auto-style14" ><asp:TextBox ID="TxtPass" runat="server" Height="24px" Width="222px" TextMode="Password"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
             ErrorMessage="please enter Password" ControlToValidate="TxtPass" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
  </tr>
        <tr>
          <td class="auto-style8" > <asp:Label ID="Label5" runat="server" Text="Confirm Password"></asp:Label></td>
         <td class="auto-style14" ><asp:TextBox ID="TxtCpass" runat="server" Height="23px" Width="222px" TextMode="Password"></asp:TextBox></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
             ErrorMessage="please comfirm Password" ControlToValidate="TxtCpass" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
        
         </tr>
         </table>

        </div>  </div>   <br />
         <asp:Button ID="btnreg" runat="server" Text="Register" Width="408px" OnClick="btnreg_Click" CssClass="auto-style7" Height="40px" />
    </form>
</body>
</html>