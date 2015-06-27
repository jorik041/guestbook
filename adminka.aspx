<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminka.aspx.cs" Inherits="adminka" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>

      <asp:Button id="cmdSignOut" text="Log Out" runat="server" onClick="SignOut" 
            BackColor="#FFFF66" BorderColor="#CC9900" BorderStyle="Dotted" 
            Font-Size="Medium" ForeColor="Blue" />
    
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="center" OnPageIndexChanging="GridView1_PageIndexChanging" 
            PageSize="5" AutoGenerateColumns="false" Width="80%" AllowPaging="True"
            OnRowCommand="GridView1_RowCommand"
            onselectedindexchanged="GridView1_SelectedIndexChanged" >

            <Columns>

        <asp:TemplateField HeaderText="Guestbook!" SortExpression="email">
          
            <ItemTemplate>
          
            <div style="float:left">
            <center>
             <asp:Label ID="lblNomer" runat="server" ForeColor="Orange"
                    Text='<%# Bind("code") %>'></asp:Label>
                     &nbsp &nbsp &nbsp
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
            </div>
           
              <div style="float:right; left: 0px; padding-right: 25px;">
                <asp:LinkButton ID="btnDel" runat="server" Width="25" Height="25"
              CommandName="RemoveRecord"
              CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">
              <asp:Image ID="imgFolder" runat="server" ImageUrl="delete.png" BorderWidth="0" />
              </asp:LinkButton>

            </div>
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
