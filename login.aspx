<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table class="tb" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;</td>
            <td class="td" colspan="2">
                登录页面</td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center" colspan="2" valign="middle">
                <br />
                <table class="tb_lg" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            用户名：</td>
                        <td align="left">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="必须输入用户名" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            密 码：</td>
                        <td align="left">
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPwd" ErrorMessage="必须输入密码" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            权限：</td>
                        <td align="left">
                            <asp:RadioButtonList ID="rdioRight" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="管理员">管理员</asp:ListItem>
                                <asp:ListItem Value="普通用户">普通用户</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="rdioRight" ErrorMessage="必须选择权限" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <br />
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" onclick="login_Click" Text="登录" />
                            &nbsp;<asp:Button ID="reset" runat="server" onclick="reset_Click" Text="重置" />
                            <br />
                            <br />
                            还没有账号，现在<a href="register.aspx">注册</a></td>
                        <td align="left">
                            <a href="forgetPwd.aspx">忘记密码？</a></td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="2">
            </td>
            <td>
            </td>
        </tr>
    </table>
&nbsp;
</asp:Content>

