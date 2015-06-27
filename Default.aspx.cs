using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;



public partial class _Default : System.Web.UI.Page
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


    public void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();

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
          messs = Convert.ToString(messs).Replace(":)", "<img alt='smile' src='emotions/smile.gif' />");
          messs = Convert.ToString(messs).Replace(";)", "<img alt='wink' src='emotions/wink.gif' />");
          messs = Convert.ToString(messs).Replace(":(", "<img alt='sad' src='emotions/sad.gif' />");
          messs = Convert.ToString(messs).Replace(":robot:", "<img alt='robot' src='emotions/robot.gif' />");
          messs = Convert.ToString(messs).Replace(":oops:", "<img alt='oops' src='emotions/oops.gif' />");
          messs = Convert.ToString(messs).Replace(":inLove:", "<img alt='love' src='emotions/inLove.gif' />");
          messs = Convert.ToString(messs).Replace(":fingerUp:", "<img alt='finger up' src='emotions/fingerUp.gif' />");
          messs = Convert.ToString(messs).Replace(":fingerDown:", "<img alt='finger down' src='emotions/fingerDown.gif' />");
          messs = Convert.ToString(messs).Replace(":angel:", "<img alt='angel' src='emotions/angel.gif' />");
          messs = Convert.ToString(messs).Replace(":angry:", "<img alt='angry' src='emotions/angry.gif' />");
          return messs;

      }

      return "";
  }


}