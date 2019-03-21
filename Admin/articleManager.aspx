<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="articleManager.aspx.cs" Inherits="Admin_articleManager1" %>

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
                文章管理</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="articleId,username" DataSourceID="AccessDataSource1" 
                    AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="标题" SortExpression="title">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkTitle" runat="server" 
                                    CommandArgument='<%# Eval("articleId") %>' oncommand="lnkTitle_Command" 
                                    Text='<%# Eval("title").ToString().Length>6?Eval("title").ToString().Substring(0,6)+"...":Eval("title").ToString() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="正文" SortExpression="content">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkContent" runat="server" 
                                    CommandArgument='<%# Eval("articleId") %>' oncommand="lnkContent_Command" 
                                    Text='<%# Eval("content").ToString().Length>100?Eval("content").ToString().Substring(0,100)+"...":Eval("content").ToString() %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="username" HeaderText="作者" ReadOnly="True" 
                            SortExpression="username" />
                        <asp:BoundField DataField="writeTime" HeaderText="发表时间" 
                            SortExpression="writeTime" />
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="return confirm('确认删除吗？');"
                                    CommandArgument='<%# Eval("articleId") %>'>删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Blog.mdb" 
                    SelectCommand="SELECT * FROM [articles] ORDER BY [writeTime] DESC, [title]">
                </asp:AccessDataSource>
                <br />
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

