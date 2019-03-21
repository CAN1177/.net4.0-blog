using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

public partial class register : System.Web.UI.Page{

    //定义全局的类
    Common com = new Common();
    //定义连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    //定义数据集
    DataSet ds = new DataSet();
    //定义数据适配器
    OleDbDataAdapter da;
    //定义整型变量i
    int i;
    protected void Page_Load(object sender, EventArgs e){
        if(!IsPostBack ){
         if(Session["username"] !=null){
            Response.Write(com.msgBoxPage("尊敬的用户，请您先注销再注册"));
         }
          //产生随机变量
        randCode.Text = com.random(5);
        }
        
    }

    //看不清，换一张 按钮的点击事件
    protected void lnkBtn_Click(object sender, EventArgs e){
        randCode.Text = com.random(5);
    }

    //注册按钮的点击事件
    protected void btnRegister_Click(object sender, EventArgs e){

        //判断连接的状态，如果关闭就打开
        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义命令对象,从管理员表中的查找有跟文本框用户名重复的记录
        OleDbCommand comm1 = new OleDbCommand("select * from admins where username='" + name.Text + "'", conn);
        da = new OleDbDataAdapter(comm1);
        da.Fill(ds, "admin");
        i = Convert.ToInt32(ds.Tables["admin"].Rows.Count);
        //判断用户名是否跟管理员表的用户名重复，如果是，提示不能注册并刷新页面
        if (i > 0){
            Response.Write(com.msgBoxPage("不好意思！你的用户名不能为admin，请重新注册"));
        }
        else{
            //定义命令对象从用户名中查找用户名、qq和对应用户名文本框、qq文本框相同的记录
            OleDbCommand comm2 = new OleDbCommand("select * from users where username='" + name.Text + "' or qq='" + txtqq.Text.Trim().ToString() + "'", conn);
            da = new OleDbDataAdapter(comm2);
            da.Fill(ds, "user");

            if (ds.Tables["user"].Rows.Count > 0){
                Response.Write(com.msgBox("该用户名或QQ已经被注册过，请重新填写！！！", "register.aspx"));
            }

            else{
                //文本框验证码和标签验证码都转化为大写，再判断两边是否相等，是就执行插入语句
                if (txtCode.Text.Trim().ToString().ToUpper() == randCode.Text.Trim().ToString().ToUpper()){
                    //定义命令对象
                    OleDbCommand comm = new OleDbCommand("insert into users(username,pwd,sex,QQ,hobby,identify,rgTime) values('" + name.Text.Trim().ToString() + "','" + pwd.Text.Trim().ToString() + "','" + radioSex.SelectedValue + "','" + txtqq.Text.Trim().ToString() + "','" + txtHobby.Text.Trim().ToString() + "','" + dlstID.SelectedValue + "','" + DateTime.Now.ToString() + "')", conn);
                    i = Convert.ToInt32(comm.ExecuteNonQuery());

                    if (i > 0){
                        //插入操作成功就给相应提示
                        Response.Write(com.msgBox("注册成功（请记住您的注册信息）！正在为您跳转", "register.aspx"));
                    }

                    else{
                        //操作失败也给相应提示
                        Response.Write(com.msgBox("注册失败！请您重新注册", "register.aspx"));
                    }
                }

                //验证码错误阻止插入记录
                else{
                    Response.Write(com.msgBox("验证码错误！请重新填写", "register.aspx"));
                }
            }
            
        }

        if(conn.State==ConnectionState.Open ){
            conn.Close();
        }
    }

    //重置按钮的点击事件
    protected void reset_Click(object sender, EventArgs e){
        //清空所有内容
        name.Text = "";
        pwd.Text = "";
        confirmPwd.Text = "";
        txtqq.Text = "";
        txtHobby.Text = "";
        radioSex.SelectedIndex = -1;
        txtCode.Text = "";
    }

}