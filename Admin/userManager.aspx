<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="userManager.aspx.cs" Inherits="Admin_userManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <br />
        <table class="tb">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="td" colspan="2">
                    用户管理</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource1" 
                        ForeColor="#333333" GridLines="None" PageSize="6">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="用户名" 
                                SortExpression="username" />
                            <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                            <asp:BoundField DataField="qq" HeaderText="qq" SortExpression="qq" />
                            <asp:BoundField DataField="hobby" HeaderText="爱好" SortExpression="hobby" />
                            <asp:BoundField DataField="identify" HeaderText="身份证" 
                                SortExpression="identify" />
                            <asp:BoundField DataField="rgTime" HeaderText="注册时间" SortExpression="rgTime" />
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="return confirm('删除用户会把相关的文章和留言都删除掉。确认删除吗？');" oncommand="lnkDel_Command" CommandArgument='<%# Eval("userId") %>'>删除</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" 
                            PreviousPageText="上一页" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/Blog.mdb" 
                        SelectCommand="SELECT * FROM [users] ORDER BY [rgTime] DESC">
                    </asp:AccessDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
   

</asp:Content>

