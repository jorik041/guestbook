using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{

    int kolvo;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    
    protected void ProcessLogin(object sender, EventArgs e)
    {
        kolvo = 0;
        if (Session["LoginKolvo"] != null)
        {
            kolvo = (int)Session["LoginKolvo"];
        }
        if (kolvo>4) {
            lblError.Text = "To much fails! Go away, please!";
        return;
        }
        kolvo = kolvo+1;
        Session.Add("LoginKolvo",kolvo);


         if (FormsAuthentication.Authenticate(txtUser.Text, txtPassword.Text)){
             kolvo = 0;
             Session.Add("LoginKolvo", kolvo);
     FormsAuthentication.RedirectFromLoginPage(txtUser.Text, chkPersistLogin.Checked);
         }
  else{}

     
    }


}