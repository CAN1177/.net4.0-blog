<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgetPwd.aspx.cs" Inherits="forgetPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br />
    <table class="tb" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            </td>
            <td class="td" colspan="2">
                密码修改</td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <br />
                <table class="tb_fg">
                   <tr>
                        <td align="right">
                            用户名：</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            绑定的QQ：</td>
                        <td>
                            <asp:TextBox ID="bdQQ" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            新密码：</td>
                        <td>
                            <asp:TextBox ID="nPwd" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="nPwd" ErrorMessage="必须输入密码" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            确认密码：</td>
                        <td>
                            <asp:TextBox ID="cPwd" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="nPwd" ControlToValidate="cPwd" ErrorMessage="与原密码不一致" 
                                ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                        </td>
                        <td align="center">
                            <asp:Button ID="btnReset" runat="server" onclick="btnReset_Click" Text="修改" />
                            &nbsp;<asp:Button ID="cancel" runat="server" onclick="cancel_Click" Text="取消" />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

