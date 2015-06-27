<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guestbook</title>

     <style type="text/css">
  .pagerst{
    letter-spacing: 5px;
   }
   
    .grd{
     width:80%; 
    margin-left:15%; 
    margin-right:15%;
   }

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


  </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <center>
    <a href="addmessage.aspx" target="_self">
    <img src="btnAddRecord.png" alt="Add message" style="border:none" />
    </a>
    </center>
    <br />

        <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" 
            PageSize="5" AutoGenerateColumns="false" AllowPaging="True" 
            CssClass="grd" >

            <Columns>

        <asp:TemplateField HeaderText="Guestbook!" SortExpression="email">
          
            <ItemTemplate>
            <center>
                 <asp:Label ID="Label2" runat="server" ForeColor="Orange"
                    Text='<%# Bind("senderName") %>'></asp:Label>
                     &nbsp; &nbsp; &nbsp;
                <asp:Label ID="lblMsg" runat="server" ForeColor="DarkBlue"
                    Text='<%# Bind("email") %>'></asp:Label>
                     &nbsp; &nbsp; &nbsp;
                     <asp:Label ID="Label1" runat="server" ForeColor="BurlyWood"
                    Text='<%# Bind("dte") %>'></asp:Label>
              <br />
              </center>

       <%--    <%# ((string)Eval("txt")).Replace(":)", "<img src='secretsmile.png'>")%> --%>


            <%# ConvertFlag(Eval("txt")) %>

            </ItemTemplate>
        </asp:TemplateField>
</Columns>


            <PagerStyle CssClass="pagerst" Font-Names="Georgia,Comic Sans" 
                Font-Size="X-Large" ForeColor="#CC00FF" />


        </asp:GridView>

    </div>
    </form>

</body>
</html>
