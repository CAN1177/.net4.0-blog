using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class aboutMe : System.Web.UI.Page{
    //定义一个全局的类
    Common com = new Common();
    //当前页面的加载事件
    protected void Page_Load(object sender, EventArgs e){

        //判断是否为已登录用户，若否，就提示用户先登录
        if (Session["username"] == null){
            Response.Write(com.msgBox("尊敬的用户，请您先登录！！！", "login.aspx"));
        }
        //否则，显示个人信息（从登录页面提取保存的信息）
        else{
            lblName.Text = Convert.ToString(Session["username"]);
            lblSex.Text = Convert.ToString(Session["sex"]);
            lblQQ.Text = Convert.ToString(Session["qq"]);
            lblHobby.Text = Convert.ToString(Session["hobby"]);
            lblIdentify.Text = Convert.ToString(Session["identify"]);
            lblTime.Text = Convert.ToString(Session["rgTime"]);
        }
    }
}