<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedBack.aspx.cs" Inherits="leaveWord" %>

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
                用户留言</td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <br />
                <table id="tb_fb">
                    <tr>
                        <td align="left" colspan="3">
                            &nbsp;&nbsp;尊敬的会员！感谢您为我们的博客网站献计献策！！！<br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            留言主题：</td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" Width="300px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtSubject" ErrorMessage="留言主题不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            留言内容：</td>
                        <td valign="top">
                            <asp:TextBox ID="txtContent" runat="server" Height="200px" TextMode="MultiLine" 
                                Width="350px"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtContent" ErrorMessage="留言内容不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="center">
                            <asp:Button ID="submit" runat="server" onclick="submit_Click" Text="提交" />
                            &nbsp;<asp:Button ID="reset" runat="server" onclick="reset_Click" Text="重置" />
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
&nbsp;
</asp:Content>

