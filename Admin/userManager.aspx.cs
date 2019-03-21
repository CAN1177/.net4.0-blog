using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
public partial class Admin_userManager : System.Web.UI.Page{

    //定义一个全局的类
    Common com = new Common();
    //定义连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    //
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e){

        //判断是否为已登录用户，若否，就提示用户先登录
        if (Session["username"] == null){
            Response.Write(com.msgBox("尊敬的用户，请您先登录！！！", "../login.aspx"));
        }

    }
    protected void lnkDel_Command(object sender, CommandEventArgs e){

        //打开数据库
        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义命令对象，从要删除的用户表中找出对应的信息
        OleDbCommand comm = new OleDbCommand("select * from users where userId=" + e.CommandArgument, conn);

        OleDbDataAdapter da = new OleDbDataAdapter(comm);
        da.Fill(ds, "user");
        Session["username"]=ds.Tables["user"].Rows[0]["username"].ToString();
        //定义命令对象1、删除用户表的用户信息
        OleDbCommand comm1 = new OleDbCommand("delete from users where userId=" + e.CommandArgument, conn);
        //定义命令对象2，删除该用户的所有留言
        OleDbCommand comm2 = new OleDbCommand("delete from words where username='"+Convert.ToString(Session["username"])+"'", conn);
        //定义命令对象2，删除该用户的所有文章
        OleDbCommand comm3 = new OleDbCommand("delete from articles where username='" + Convert.ToString(Session["username"]) + "'", conn);
        //执行命令对象，并将执行结果转换为整型
        int i = Convert.ToInt32(comm1.ExecuteNonQuery());
        int m=Convert.ToInt32(comm2.ExecuteNonQuery());
        int n = Convert.ToInt32(comm3.ExecuteNonQuery());

        if (i > 0 && m>0 && n>0){
            Response.Write(com.msgBox("删除用户成功！并且其相关的文章和留言也删除！正在跳转！！！", "userManager.aspx"));
        }
        else{
            Response.Write(com.msgBox("删除失败！正在跳转！！！", "userManager.aspx"));
        }
        //判断数据库的状态，如果打开就关闭
        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }

}