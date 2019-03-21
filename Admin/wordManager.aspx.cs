using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class Admin_wordManager : System.Web.UI.Page{
    //定义一个全局的类
    Common com = new Common();
    //定义连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);

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

        //定义命令对象，
        OleDbCommand comm = new OleDbCommand("delete from words where wordId="+e.CommandArgument, conn);
        int i = Convert.ToInt32(comm.ExecuteNonQuery());
        if (i > 0){
            Response.Write(com.msgBox("删除成功！正在跳转！！！", "wordManager.aspx"));
        }
        else {
            Response.Write(com.msgBox("删除失败！正在跳转！！！", "wordManager.aspx"));
        }

        //判断数据库的状态，如果打开就关闭
        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }
}