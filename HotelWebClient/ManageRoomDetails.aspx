<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRoomDetails.aspx.cs" Inherits="HotelWebClient.ManageRoomDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script> 
        var loadFile = function (event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src)
            }
        };
        fetch("./HotelDashboard.aspx")
            .then(response => {
                return response.text()
            })
            .then(data => {
                document.querySelector("header").innerHTML = data;
            });</script>
    <style>
        body{background-color:darkgray;}
        #formUpdate{margin-left:360px;
                 border:inset;
                width:500px;
                padding:10px;
                margin-top:20px;
                background-color:white;
}
        #btnUpdate{margin-left:150px;}
    </style>
</head>
<body>
    <header></header>
    <form id="formUpdate" runat="server" class="auto-style2">
        <div>
            <h4>Update Room details</h4>
           <table>
            
         <tr><td class="auto-style1"> <asp:Label ID="Roomid" runat="server" Text="Label"></asp:Label></td></tr>
         <tr><td class="auto-style1"> <asp:Image ID="output" runat="server"  width="220px" Height="200px"/></td></tr>  
               <tr><td class="auto-style1"><asp:FileUpload ID="ImageFile1" runat="server" onchange="loadFile(event)"/></td>
                   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
             ErrorMessage="select image" ControlToValidate="ImageFile1" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
               </tr>
            <tr><td class="auto-style1"><h4>Price:  <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></h4></td>
                <td><asp:RequiredFieldValidator ID="RVFUsername" runat="server"
             ErrorMessage="please enter new price entered" ControlToValidate="txtPrice" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
            </tr>
               <tr><td class="auto-style1"><h4>Quantity:  <asp:TextBox ID="txtQunatity" runat="server"></asp:TextBox></h4></td>
                   <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
             ErrorMessage="please enter new entered" ControlToValidate="txtQunatity" ForeColor="#FF3300"></asp:RequiredFieldValidator></td>
               </tr>
            
               </table>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Width="182px" />
        </div>
       
    </form>
</body>
    
</html>
