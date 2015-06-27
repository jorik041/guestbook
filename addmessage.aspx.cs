using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;



public partial class addmessage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnAdd_Click(object sender, EventArgs e)
    {


        try
        {

            if (Page.IsValid && (txtCaptcha.Text.ToString() == Session["AlexCapStr"].ToString()))
            {
                //  lblWrongCaptcha.Text = "Code verification Successful";
            }

            else
            {
                txtCaptcha.Text = "";
                lblWrongCaptcha.Text = "Wrong capture code";
                return;
            }

        }
        catch
        {
            return;
        }


        string cs;
        cs = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("guestdb.mdb");

        OleDbConnection dbconn;


            dbconn = new OleDbConnection(cs);
            try
            {
              dbconn.Open();

            string messageText;
            messageText = txtMessage.Text;

            messageText = messageText.Replace("\n", "<br />");

            OleDbCommand dbcomm = dbconn.CreateCommand();

            dbcomm.CommandText = "INSERT INTO messages (senderName,email,txt,dte) VALUES (?,?,?,'" + DateTime.Now + "')";

            OleDbParameter p1 = new OleDbParameter();
            OleDbParameter p2 = new OleDbParameter();
            OleDbParameter p3 = new OleDbParameter();

            dbcomm.Parameters.Add(p1);
            dbcomm.Parameters.Add(p2);
            dbcomm.Parameters.Add(p3);

            p1.Value = txtName.Text;
            p2.Value = txtEmail.Text;
            p3.Value = messageText;


            dbcomm.ExecuteNonQuery();


        }
        catch
        {

        }
        finally
        {
            dbconn.Close();
            dbconn.Dispose();
        }

        Response.Redirect("Default.aspx");   

    }
}