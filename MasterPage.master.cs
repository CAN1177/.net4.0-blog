using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    //定义全局的类
    Common com = new Common();

    protected void Page_Load(object sender, EventArgs e){
       
            if (Session["username"] != null){
               //bl.Text = Convert.ToString(Session["username"])+"的空间";
                lblName.Text ="欢迎您！"+ Convert.ToString(Session["username"]);
                lblName.Visible = true;
                Panel1.Visible = false;
                Panel2.Visible = true;
                loginOut.Text = "注销";
                loginOut.Visible = true;
                Label1.Text = Convert.ToString(Session["username"]);
                Label2.Text = Convert.ToString(Session["sex"]);
                Label3.Text = Convert.ToString(Session["identify"]);
                if (Convert.ToString(Session["sex"]) == "男"){
                    Image1.ImageUrl = "images/man.jpg";
                }
                else{
                    Image1.ImageUrl = "images/women.jpg";
                }

            }
            else{
                //否则隐藏Panel2、清空并且隐藏注销按钮和用户名标签
               //bl.Text = "";
                Panel1.Visible = true;
                Panel2.Visible = false;
                lblName.Text = "";
                lblName.Visible = false;
                loginOut.Text = "";
                loginOut.Visible = false;
            }
    }

    protected void loginOut_Click(object sender, EventArgs e){
        //点击注销按钮弹出提示框，清空并且隐藏按钮和用户名标签
        Response.Write(com.msgBox("注销成功！正在退出", "login.aspx"));
        Session["username"] = null;
        lblName.Text = "";
        loginOut.Text = "";
        lblName.Visible = false;
        loginOut.Visible = false;
    }
}
