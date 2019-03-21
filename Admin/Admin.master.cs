using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_MasterPage : System.Web.UI.MasterPage{
    //定义全局的类
    Common com = new Common();

    protected void Page_Load(object sender, EventArgs e){
        if (!IsPostBack){
            //要是用户已经登录, 则显示Panel1、用户名标签、注销按钮及个人信息
            if (Session["username"] != null){
                Label1.Text="后台管理界面";
                lblName.Text = "欢迎您！" + Convert.ToString(Session["username"]);
                lblName.Visible = true;
                Panel1.Visible = false;
                Panel2.Visible = true;
                loginOut.Text = "注销";
                loginOut.Visible = true;
                Image1.ImageUrl = "../images/man.jpg";
            }
            else{
                //否则隐藏Panel2、清空并且隐藏注销按钮和用户名标签
                Panel1.Visible = true;
                Panel2.Visible = false;
                lblName.Text = "";
                lblName.Visible = false;
                loginOut.Text = "";
                loginOut.Visible = false;
            }
        }
    }
    protected void loginOut_Click(object sender, EventArgs e){
        //点击注销按钮弹出提示框，清空并且隐藏按钮和用户名标签
        Response.Write(com.msgBox("注销成功！正在退出", "../login.aspx"));
        Session["username"] = null;
        lblName.Text = "";
        loginOut.Text = "";
        lblName.Visible = false;
        loginOut.Visible = false;
    }
}
