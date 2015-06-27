<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login page</title>
</head>
<body>

    <form id="Form1" runat="server">
<table style="border:none;width:400px;" cellspacing="0" cellpadding="0">
  <tr>
    <td style="width:80px;">Username : </td>
    <td  style="width:10px;"> </td>
    <td><asp:TextBox Id="txtUser" width="150" runat="server"/></td>
  </tr>
  <tr>
    <td>Password : </td>
    <td  style="width:10px;"> </td>
    <td><asp:TextBox Id="txtPassword" width="150" TextMode="Password" runat="server"/></td>
  </tr>
  <tr>
    <td></td>
    <td  style="width:10px;"> </td>
    <td><asp:CheckBox id="chkPersistLogin" runat="server" />Remember<br/>
    </td>
  </tr>
  <tr>
    <td> </td>
    <td  style="width:10px;"> </td>
    <td><asp:Button Id="cmdLogin" OnClick="ProcessLogin" Text="Login" runat="server" /></td>
  </tr>
</table>
<br/>
<br/>
<div>

</div>
</form>
    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
</body>
</html>
