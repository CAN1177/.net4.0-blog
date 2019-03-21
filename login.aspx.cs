using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class login : System.Web.UI.Page{
    //定义全局的类
    Common com = new Common();
    DbClass db = new DbClass();

    ////定义连接对象
    //OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    ////定义数据集
    //DataSet ds = new DataSet();

    //页面加载事件
    protected void Page_Load(object sender, EventArgs e){
        //如果用户还没有注销就提示要先注销才能登录
        if (Session["username"] != null){
            Response.Write(com.msgBoxPage("尊敬的用户，请您先注销再登录！"));
        }
    }

    //登录按钮点击事件
    protected void login_Click(object sender, EventArgs e){
        DataTable dtUsers;
        DataTable dtAdmins;
        //打开数据库
        db.Open();
        if (rdioRight.SelectedValue == "普通用户")
        {
            string strSql01 = "select * from users where username='" + txtName.Text.Trim().ToString() + "' and pwd='" + txtPwd.Text.Trim().ToString() + "'";
             dtUsers = db.getTable(strSql01, "tbUsers");
                    if (dtUsers.Rows.Count > 0)
                    {
            //如果登录的人是非管理员就保存用户的所有信息
            Response.Write(com.msgBox("登录成功！正在为您跳转！！！", "article.aspx"));
            Session["username"] = dtUsers.Rows[0]["username"];
            Session["pwd"] = dtUsers.Rows[0]["pwd"];
            Session["sex"] = dtUsers.Rows[0]["sex"];
            Session["qq"] = dtUsers.Rows[0]["QQ"];
            Session["hobby"] = dtUsers.Rows[0]["hobby"];
            Session["identify"] = dtUsers.Rows[0]["identify"];
            Session["rgTime"] = dtUsers.Rows[0]["rgTime"];
        }
        }
        else if (rdioRight.SelectedValue == "管理员")
        {

            string strSql02 = "select * from admins where username='" + txtName.Text.Trim().ToString() + "' and pwd='" + txtPwd.Text.Trim().ToString() + "'";
            dtAdmins = db.getTable(strSql02, "tbAdmins");
                                if (dtAdmins.Rows.Count > 0)
                    {
                        Response.Write(com.msgBox("登录成功！正在为您跳转！！！", "Admin/userManager.aspx"));
                        Session["username"] = dtAdmins.Rows[0]["username"];
                    }
        }
       // OleDbCommand comm1 = new OleDbCommand("select * from users where username='" + txtName.Text.Trim().ToString() + "' and pwd='" + txtPwd.Text.Trim().ToString() + "'", conn);
        //OleDbDataAdapter da1 = new OleDbDataAdapter(comm1);
        //把查找到的结果填充到数据集中
        //da1.Fill(ds, "user");
        //定义命令对象，从管理员查找用户名和密码，并与文本框对应的用户名和密码进行想匹配，正确的就允许登录
        //OleDbCommand comm2 = new OleDbCommand(, conn);
        //OleDbDataAdapter da2 = new OleDbDataAdapter(comm2);
        //把查找到的结果填充到数据集中
        //da2.Fill(ds, "admin");

        //如果权限和登录信息都正确，跳转到相应页面




        else{
            Response.Write(com.msgBox("输入有误！请重新输入！！！", "login.aspx"));
        }
        //判断数据库的状态，如果打开就关闭        
        db.Close();
    }

    //清空填写信息
    protected void reset_Click(object sender, EventArgs e){
        txtName.Text = "";
        txtPwd.Text = "";
        rdioRight.SelectedIndex = -1;
    }
}