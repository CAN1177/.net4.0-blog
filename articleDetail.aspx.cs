using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class articleDetail : System.Web.UI.Page{

    //定义连接对象，类，数据集
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    Common com = new Common();
    DataSet ds = new DataSet();
    int i;

    protected void Page_Load(object sender, EventArgs e){

        //判断用户是否登录，没有就让他登录
        if (Session["username"] == null){
            Response.Write(com.msgBox("尊敬的用户，请您先登录", "login.aspx"));
        }

        else{

            //判断数据库的连接状态
            if (conn.State == ConnectionState.Closed){
                conn.Open();
            }

            //从前一页面传回来的id获取留言的信息，并填充到各个字段
            OleDbCommand comm = new OleDbCommand("select * from articles where articleID=" + Request.QueryString["articleID"].ToString(), conn);
            OleDbDataAdapter da = new OleDbDataAdapter(comm);
            da.Fill(ds, "article");
            Label1.Text = ds.Tables[0].Rows[0]["title"].ToString();
            Label2.Text = ds.Tables[0].Rows[0]["content"].ToString();
            lblTime.Text = ds.Tables[0].Rows[0]["writeTime"].ToString();

            if (conn.State == ConnectionState.Open){
                conn.Close();
            }
        }
    }

    protected void del_Click(object sender, EventArgs e){

        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义删除的命令对象
        OleDbCommand comm = new OleDbCommand("delete from articles where articleID=" + Request.QueryString["articleID"].ToString(), conn);
        i = Convert.ToInt32(comm.ExecuteNonQuery());
        if (i > 0){
            Response.Write(com.msgBox("删除成功，正在跳转", "article.aspx"));
        }
        else{
            Response.Write(com.msgBoxPage("删除失败，正在跳转"));
        }

        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }
    protected void back_Click(object sender, EventArgs e){

        Response.Redirect("article.aspx");
    }
}