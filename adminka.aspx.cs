using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.OleDb;
using System.Data;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;



public partial class adminka : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
            bind();
    }


    void bind()
    {

        string cs;
        cs = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("guestdb.mdb");

        OleDbConnection dbconn;

        dbconn = new OleDbConnection(cs);
        try
        {

            dbconn.Open();

            string sqlstr = "SELECT * FROM messages";
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter(sqlstr, dbconn);
            da.Fill(ds);


            GridView1.PagerSettings.NextPageText = "Next page";
            GridView1.PagerSettings.PreviousPageText = "Previous page";
            GridView1.PagerSettings.Mode = PagerButtons.Numeric;

                GridView1.DataSource = ds;
                GridView1.DataBind();

            da.Dispose();
        }

        catch { }
        finally
        {

            dbconn.Close();
            dbconn.Dispose();
        }

    }



    protected void SignOut(object sender, EventArgs e)
    {
        try
        {
            FormsAuthentication.SignOut();
            Response.Redirect(Request.UrlReferrer.ToString());
        }
        catch { }

    }



    protected string ConvertFlag(object value)
    {

        if (value != DBNull.Value)
        {

            System.Text.StringBuilder sb = new System.Text.StringBuilder(
                   HttpUtility.HtmlEncode(value));
            // Selectively allow  <b> and <i>
            sb.Replace("&lt;b&gt;", "<b>");
            sb.Replace("&lt;/b&gt;", "</b>");
            sb.Replace("&lt;i&gt;", "<i>");
            sb.Replace("&lt;/i&gt;", "</i>");

            sb.Replace("&lt;br /&gt;", "<br />");

            string messs = "";
            messs = sb.ToString();
            messs = Convert.ToString(messs).Replace(":)", "<img src='emotions/smile.gif'>");
            messs = Convert.ToString(messs).Replace(";)", "<img src='emotions/wink.gif'>");
            messs = Convert.ToString(messs).Replace(":(", "<img src='emotions/sad.gif'>");
            messs = Convert.ToString(messs).Replace(":robot:", "<img src='emotions/robot.gif'>");
            messs = Convert.ToString(messs).Replace(":oops:", "<img src='emotions/oops.gif'>");
            messs = Convert.ToString(messs).Replace(":inLove:", "<img src='emotions/inLove.gif'>");
            messs = Convert.ToString(messs).Replace(":fingerUp:", "<img src='emotions/fingerUp.gif'>");
            messs = Convert.ToString(messs).Replace(":fingerDown:", "<img src='emotions/fingerDown.gif'>");
            messs = Convert.ToString(messs).Replace(":angel:", "<img src='emotions/angel.gif'>");
            messs = Convert.ToString(messs).Replace(":angry:", "<img src='emotions/angry.gif'>");
            return messs;

        }

        return "";
    }


    public void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "RemoveRecord")
        {
            string lbltext;
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];

                Label lbl = row.FindControl("lblNomer") as Label;
                lbltext = lbl.Text.Trim();
            }
            catch {
                return; 
            }

            string cs;
            cs = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("guestdb.mdb");

            OleDbConnection dbconn;


            dbconn = new OleDbConnection(cs);
            try
            {
                dbconn.Open();


                string sqlstr = "DELETE FROM messages WHERE code=" + lbltext + "";
                OleDbCommand dbcomm = new OleDbCommand(sqlstr, dbconn);

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



        }

        bind();
    }



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    
    


}