using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
public partial class Admin_articleManager1 : System.Web.UI.Page
{
    //定义一个全局的类
    Common com = new Common();
    //定义一个全局的连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否为已登录用户，若否，就提示用户先登录
        if (Session["username"] == null)
        {
            Response.Write(com.msgBox("尊敬的用户，请您先登录！！！", "../login.aspx"));
        }
        
    }
    protected void lnkTitle_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("articleDetail.aspx?articleId="+Convert.ToInt32(e.CommandArgument));
    }
    protected void lnkContent_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("articleDetail.aspx?articleId=" + Convert.ToInt32(e.CommandArgument));
    }
}