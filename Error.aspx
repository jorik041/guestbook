<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

       <style type="text/css">

a{
text-decoration:none;
color:Orange;
}

a:visited 
{ text-decoration: none;
color:#B82424;}
a:active 
{text-decoration: none;
color:#004444; 
}

#lozung{
font-size:14pt;
color:#EF2215;
font-family:Georgia,Serif;
}

  </style>

</head>
<body>
  <%--  <form id="form1" runat="server">
    <div>
    
    </div>
    </form>--%>

    <center>
    <h2>Some exception was thrown</h2>
    <p>Probably you have tried to insert some script or html into guestbook. No, no! That's not allowed!</p>

    <p id="lozung"><i>
<a href="Default.aspx">Back to guestbook</a>
</i></p>
</center>

</body>
</html>
