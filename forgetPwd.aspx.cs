using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class forgetPwd : System.Web.UI.Page
{

    //定义一个全局的类、数据集和连接对象
    Common com = new Common();
    DataSet ds = new DataSet();
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    int i=0;

    protected void Page_Load(object sender, EventArgs e){
            
    }

    protected void btnReset_Click(object sender, EventArgs e){

        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义命令对象，将数据库中用户名和相对应绑定的QQ都找出来并和文本框中对应字段相比较，
        OleDbCommand comm1 = new OleDbCommand("select * from users where username='"+txtName.Text.Trim().ToString()+"' and qq='"+bdQQ.Text.Trim().ToString()+"'", conn);
        OleDbDataAdapter da = new OleDbDataAdapter(comm1);
        da.Fill(ds, "user");
        //如果存在用户名以及绑定QQ正确无误的
        if (ds.Tables["user"].Rows.Count>0){
            //允许更改密码
            OleDbCommand comm2 = new OleDbCommand("update users set pwd='" + nPwd.Text.Trim().ToString() + "' where username='" + txtName.Text.Trim().ToString() + "'", conn);
            i = Convert.ToInt32(comm2.ExecuteNonQuery());
            if (i > 0){
                Response.Write(com.msgBox("修改成功，现在就去登录", "login.aspx"));
            }
            else{
                Response.Write(com.msgBox("修改失败，请重新修改", "forgetPwd.aspx"));
            }
        }

        //如果不存在，提示错误
        else {
            Response.Write(com.msgBox("输入的用户名或绑定的QQ有误，请重新输入", "forgetPwd.aspx"));
        }
        if (conn.State == ConnectionState.Open){
            conn.Close();
         }
    }
    protected void cancel_Click(object sender, EventArgs e){

        Response.Redirect("forgetPwd.aspx");
    }
}