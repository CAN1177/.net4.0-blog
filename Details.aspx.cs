using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class Details : System.Web.UI.Page{
    //定义连接对象，类，数据集
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    Common com = new Common();
    DataSet ds = new DataSet();
    //int i;
    protected void Page_Load(object sender, EventArgs e){

        //判断本页面是否首次加载
        if (!IsPostBack){
            //判断数据库的连接状态
            if (conn.State == ConnectionState.Closed){
                conn.Open();
            }
            //从前一页面传回来的id获取留言的信息，并填充到各个字段
            OleDbCommand comm = new OleDbCommand("select * from articles where articleID=" + Request.QueryString["articleID"].ToString(), conn);
            OleDbDataAdapter da = new OleDbDataAdapter(comm);
            
            da.Fill(ds, "article");
            string ID = ds.Tables[0].Rows[0]["articleId"].ToString();
            Label1.Text = ds.Tables[0].Rows[0]["title"].ToString();
            Label2.Text = ds.Tables[0].Rows[0]["content"].ToString();
            lblTime.Text = ds.Tables[0].Rows[0]["writeTime"].ToString();

            if (conn.State == ConnectionState.Open){
                conn.Close();
            }
            if (Session["username"] != null)
            {
                Label3.Text =Common.AddCounts(ID, Session["username"].ToString()).ToString();
            }
            else
            {
                Label3.Text = Common.AddCounts(ID, "").ToString();
            }
        }
        else{
            
        }
    }
    protected void back_Click(object sender, EventArgs e){
        Response.Redirect("Default.aspx");
    }

}