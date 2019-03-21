using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class leaveWord : System.Web.UI.Page{

    //定义一个全局的类
    Common com = new Common();
    //定义一个全局的连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);

    //当前页面的加载事件
    protected void Page_Load(object sender, EventArgs e){
        //判断是否为已登录用户，若否，就提示用户先登录
        if (Session["username"] == null){
            Response.Write(com.msgBox("尊敬的用户，请您先登录！！！", "login.aspx"));
        }
    }

    //提交按钮的点击事件
    protected void submit_Click(object sender, EventArgs e){

        //判断数据库的状态，如果关闭就打开
        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义命令对象，执行插入语句
        OleDbCommand comm = new OleDbCommand("insert into words(username,subject,content,showTime) values('" + Convert.ToString(Session["username"]) + "','" + txtSubject.Text.Trim().ToString() + "','" + txtContent.Text.Trim().ToString() + "','" + DateTime.Now.ToString() + "')", conn);
        //定义整型变量，并将sql语句返回受影响的行数赋值给整型变量，且进行判断
        int i = Convert.ToInt32(comm.ExecuteNonQuery());
        if (i > 0){
            Response.Write(com.msgBox("发表成功，谢谢您的参与！！！", "feedBack.aspx"));
        }
        else{
            Response.Write(com.msgBoxPage("发表失败，请重新填写！！！"));
        }

        //判断数据库的状态，如果打开就关闭
        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }

    //重置按钮的点击事件
    protected void reset_Click(object sender, EventArgs e){
        //清空填写内容
        txtSubject.Text = "";
        txtContent.Text = "";
    }
}