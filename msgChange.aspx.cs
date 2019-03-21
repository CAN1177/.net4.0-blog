
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

//本程序先判断用户名、QQ是否会重复，如果不重复，再判断密码是否正确，正确，可以修改，错误，提示密码错误；如果重复，不管密码是否正确都不让修改

public partial class msgChange : System.Web.UI.Page{

    //定义一个全局的类
    Common com = new Common();
    //定义一个全局的连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    //定义一个数据集
    DataSet ds = new DataSet();
    int i;

    //当前页面的加载事件
    protected void Page_Load(object sender, EventArgs e){

        //判断是否为已登录用户，若否，就提示用户先登录
        if (!IsPostBack){
            //判断用户是否登录,如果没有则跳转到登录页面
            if (Session["username"] == null){
                Response.Write(com.msgBox("尊敬的用户，请您先登录", "login.aspx"));
            }
            else{
                //要是登录就从用户表查找登录者的用户名,电子邮箱,性别并填充到对应的表格
                if (conn.State == ConnectionState.Closed){
                    conn.Open();
                }

                //定义命令对象，登录者的用户名、密码、邮箱、性别
                OleDbCommand comm = new OleDbCommand("select * from users where username='" + Convert.ToString(Session["username"]) + "'", conn);
                OleDbDataAdapter da = new OleDbDataAdapter(comm);
                da.Fill(ds, "user");
                //填充到各个文本框
                name.Text = ds.Tables[0].Rows[0]["username"].ToString();
                txtQQ.Text = ds.Tables[0].Rows[0]["QQ"].ToString();
                rdioSex.SelectedValue = ds.Tables[0].Rows[0]["sex"].ToString();
                rdioSex.Enabled = false;
                txtHobby.Text = ds.Tables["user"].Rows[0]["hobby"].ToString();

                //关闭数据库的连接
                if (conn.State == ConnectionState.Open){
                    conn.Close();
                }
            }
        }

    }

    protected void cancel_Click(object sender, EventArgs e){

        Response.Redirect("msgChange.aspx");
    }
    protected void reset_Click(object sender, EventArgs e){

        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //把登录的密码查找出来，主要是用来后面的保存时判断原密码是否输入正确
        OleDbCommand comm1 = new OleDbCommand("select pwd from users where username='" + Convert.ToString(Session["username"]) + "'", conn);
        OleDbDataAdapter da1 = new OleDbDataAdapter(comm1);
        da1.Fill(ds, "user1");

        //查询整张表中除了已经登录外的用户名和邮箱，用于与修改填写的用户名和邮箱相比较
        OleDbCommand comm2 = new OleDbCommand("select username,QQ from users where username<>'" + Convert.ToString(Session["username"]) + "' and QQ<>'" + Convert.ToString(Session["qq"]) + "'", conn);

        //定义数据适配器，填充查询到的数据到数据集
        OleDbDataAdapter da2 = new OleDbDataAdapter(comm2);
        da2.Fill(ds, "user2");

        //做循环，将文本框中的用户名与现有的表中的用户名一一比较，如果存在，就提示用户不能继续修改
        for (i = 0; i < ds.Tables["user2"].Rows.Count; i++){

            if (name.Text.Trim().ToString() == ds.Tables["user2"].Rows[i]["username"].ToString() || txtQQ.Text.Trim().ToString() == ds.Tables["user2"].Rows[i]["QQ"].ToString()){

                //提示用户名或邮箱已经存在，请重新修改
                Response.Write(com.msgBoxPage("该用户名或QQ已经存在，请重新修改"));
                return;
            }
        }

        //如果原始密码输入正确，则允许修改
        if (txtPwd.Text.Trim().ToString() == ds.Tables["user1"].Rows[0]["pwd"].ToString()){

            //修改登录用户的个人信息
            OleDbCommand comm3 = new OleDbCommand("update users set username='" + name.Text.Trim().ToString() + "', pwd='" + nPwd.Text.Trim().ToString() + "', QQ='" + txtQQ.Text.Trim().ToString() + "',hobby='" + txtHobby.Text.Trim().ToString() + "' where username='" + Convert.ToString(Session["username"]) + "'", conn);
            //执行命令语句
            i = Convert.ToInt32(comm3.ExecuteNonQuery());
            //根据成功与否给予不同的提示
            if (i > 0){

                OleDbCommand comm4 = new OleDbCommand("update articles set username='" + name.Text.Trim().ToString() + "' where username='" + Convert.ToString(Session["username"]) + "'", conn);
                comm4.ExecuteNonQuery();
                OleDbCommand comm5 = new OleDbCommand("update words set username='" + name.Text.Trim().ToString() + "' where username='" + Convert.ToString(Session["username"]) + "'", conn);
                comm5.ExecuteNonQuery();
                Response.Write(com.msgBox("信息修改成功！正在为您跳转（需重新登录才能生效）", "article.aspx"));
            }
            else{
                Response.Write(com.msgBoxPage("信息修改失败！请重试！！！"));
            }
        }

        else{
            Response.Write(com.msgBox("原密码有误！请重新输入", "msgChange.aspx"));
        }

        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }
}