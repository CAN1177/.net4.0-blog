using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

public partial class article : System.Web.UI.Page
{

    //定义全局的类
    Common com = new Common();
    DbClass db = new DbClass();
    //定义一个全局的连接对象
    OleDbConnection conn = new OleDbConnection(ConfigurationManager.AppSettings["conn"]);
    //定义一个全局的数据集
    DataSet ds = new DataSet();

    //页面加载事件
    protected void Page_Load(object sender, EventArgs e){

        //判断是否为已登录用户，若否，就提示用户先登录
        if (Session["username"] == null){
            Response.Write(com.msgBox("尊敬的用户，请您先登录！！！", "login.aspx"));
        }
        Response.Cookies["username"].Value = Convert.ToString(Session["username"]);
        Response.Write(Response.Cookies["username"].Value);
        Response.Cookies["username"].Expires = DateTime.Now.AddYears(2);
        Response.Write("Cookie的过期时间是2年");
        //Response.Write("这是COOKIE的名字"+Response.Cookies["username"].Name+" ");
        //Response.Cookies["username"].Value = "xiao";
        //Response.Cookies["pwd"].Value = "123";
        //string strCookieName;
        //foreach(strCookieName in Request.Cookies)
        //{
            
        //}
        //Response.Write("这是COOKIE的值" + Response.Cookies["username"].Value + "  ");
        //Response.Write("这是COOKIE的值集合" + Response.Cookies["username"].Values + "   ");
    }

    //标题连接按钮的点击事件
    protected void lnkTitle_Command(object sender, CommandEventArgs e){

        //将标题的id传递到showArticle.aspx页面，并且文章标题和内容全部展开
        Response.Redirect("articleDetail.aspx?articleID=" + Convert.ToInt32(e.CommandArgument));

    }

    //内容连接按钮的点击事件
    protected void lnkContent_Command(object sender, CommandEventArgs e){

        //将标题的id传递到showArticle.aspx页面，并且文章标题和内容全部展开
        Response.Redirect("articleDetail.aspx?articleID=" + Convert.ToInt32(e.CommandArgument));
    }

    //删除连接按钮的点击事件
    protected void lnkDel_Command(object sender, CommandEventArgs e){

        //判断数据库的状态，如果为关闭就打开
        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }

        //定义删除的命令对象
        OleDbCommand comm = new OleDbCommand("delete from articles where articleId=" + e.CommandArgument + "", conn);
        //根据命令执行对应的结果给相应的提示
        int i = Convert.ToInt32(comm.ExecuteNonQuery());
        if (i > 0){
            Response.Write(com.msgBox("删除成功！正在跳转", "article.aspx"));
        }
        else{
            Response.Write(com.msgBox("删除失败！请重试！！！", "article.aspx"));
        }

        //判断数据库的状态，如果为打开就关掉
        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }

    //添加按钮的点击事件
    protected void btnAdd_Click(object sender, EventArgs e){

        //弹出新的窗体并设置弹出窗体的标题和提交按钮的文本
        ModalPopupExtender1.Show();
        lbEdit.Text = "文章发表";
        submit.Text = "发表";

    }

    //修改按钮的点击事件
    protected void btnReset_Click(object sender, EventArgs e){

        //判断griewView视图的选择索引是否为空，为空：提示用户先选择再修改
        if (GridView1.SelectedValue == null){
            Response.Write(com.msgBox("请您先选择要操作的文章", "article.aspx"));
        }
        else {

            //否则，弹出新窗体并将要修改的文章的内容显示在新窗体中并设置弹出窗体的标题和提交按钮的文本
            ModalPopupExtender1.Show();
            lbEdit.Text = "文章修改";
            submit.Text = "保存";
            //判断数据库的连接状态
            if (conn.State == ConnectionState.Closed){
                conn.Open();
            }
            //定义命令对象，查找药修改的标题和内容
            OleDbCommand comm = new OleDbCommand("select title,content from articles where articleId=" + GridView1.SelectedValue, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(comm);
            da.Fill(ds, "article1");
            txtTitle.Text = ds.Tables["article1"].Rows[0]["title"].ToString();
            txtContent.Text = ds.Tables["article1"].Rows[0]["content"].ToString();
            //关闭数据库
            if (conn.State == ConnectionState.Open){
                conn.Close();
            }
        }
        
    }

    //提交按钮的点击事件
    protected void submit_Click(object sender, EventArgs e){

        //打开数据库
        if (conn.State == ConnectionState.Closed){
            conn.Open();
        }
        //根据按钮的文本选择执行命令语句
        if (submit.Text == "发表"){

            //定义一个命令对象，在文章表中插入作者，文章标题，内容及发表时间
            OleDbCommand comm = new OleDbCommand("insert into articles(username,title,content,writeTime) values('" + Convert.ToString(Session["username"]) + "','" + txtTitle.Text.Trim().ToString() + "','" + txtContent.Text.Trim().ToString() + "','" + DateTime.Now.ToString() + "')", conn);
            //定义一个整型，并将命令对象的执行结果影响的行数赋值给整型
            int i = comm.ExecuteNonQuery();
            //如果执行结果影响的行数大于0，则表示作者发表成功
            if (i > 0){
                //给予相关提示并刷新当前页面
                Response.Write(com.msgBox("文章发表成功，正在跳转", "article.aspx"));
            }
            else{
                //如果发表失败，给予相关提示并刷新当前页面
                Response.Write(com.msgBox("文章发表失败，请重新发表", "article.aspx"));
            }
        }
        else{

            //定义一个命令对象，在文章表中插入作者，文章标题，内容及发表时间
            OleDbCommand comm = new OleDbCommand("update articles set title='" + txtTitle.Text.Trim().ToString() + "',content='" + txtContent.Text.Trim().ToString() + "',writeTime='" + DateTime.Now.ToString() + "' where articleID=" + GridView1.SelectedValue + "", conn);
            //定义一个整型，并将命令对象的执行结果影响的行数赋值给整型
            int i = comm.ExecuteNonQuery();
            //如果执行结果影响的行数大于0，则表示作者发表成功
            if (i > 0){
                //给予相关提示并刷新当前页面
                Response.Write(com.msgBox("文章修改成功，正在跳转", "article.aspx"));
            }
            else{
                //如果更新失败，给予相关提示并刷新当前页面
                Response.Write(com.msgBox("文章修改失败，请重新发表", "article.aspx"));
            }
        }
        //判断数据库的状态，如果打开就关闭
        if (conn.State == ConnectionState.Open){
            conn.Close();
        }
    }

    //取消按钮的点击事件
    protected void cancel_Click(object sender, EventArgs e){

        ModalPopupExtender1.Hide();
    }
}