<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <br />
    <table class="tb" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            </td>
            <td class="td" colspan="2">
                注册页面</td>
        </tr>
        <tr>
            <td>
            </td>
            <td align="center">
                <br />
             
                <table class="tb_rg" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" Text="用户名：" AssociatedControlID="name"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="name" runat="server" MaxLength="12" Width="150px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="name" ErrorMessage="必须输入用户名" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label2" runat="server" Text="密 码：" AssociatedControlID="pwd"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="pwd" runat="server" MaxLength="12" TextMode="Password" 
                                Width="150px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="pwd" ErrorMessage="密码为空或不正确" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label3" runat="server" Text="确认密码：" AssociatedControlID="confirmPwd"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="confirmPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="confirmPwd" ControlToValidate="pwd" ErrorMessage="与原密码不一致" 
                                ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label4" runat="server" Text="性别：" AssociatedControlID="radioSex"></asp:Label></td>
                        <td align="left">
                            <asp:RadioButtonList ID="radioSex" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="radioSex" ErrorMessage="性别必须选择" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label5" runat="server" Text="绑定QQ：" AssociatedControlID="txtqq"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="txtqq" runat="server" MaxLength="13" Width="150px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                TargetControlID="txtqq" FilterType="Numbers" ValidChars="" runat="server">
                            </cc1:FilteredTextBoxExtender>
                            只能为数字(且最长为13位)</td>
                    </tr>

                      <tr>
                        <td align="right">
                            <asp:Label ID="Label6" runat="server" Text="爱好：" AssociatedControlID="txtHobby"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="txtHobby" runat="server" MaxLength="80" Width="200px" 
                                Height="120px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td align="left">
                            （80字以内，含标点符号）</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label7" runat="server" Text="身份：" AssociatedControlID="dlstID"></asp:Label></td>
                        <td align="left">
                            <asp:DropDownList ID="dlstID" runat="server">
                                <asp:ListItem>学生</asp:ListItem>
                                <asp:ListItem>上班族</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="left">
                           </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label8" runat="server" Text="验证码：" AssociatedControlID="txtCode"></asp:Label></td>
                        <td align="left">
                            <asp:TextBox ID="txtCode" runat="server" Width="150px"></asp:TextBox>
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="randCode" runat="server" BackColor="#99FF66"></asp:Label>
                                    <asp:LinkButton ID="lnkBtn" runat="server" onclick="lnkBtn_Click" 
                                        ValidationGroup="2">看不清，换一张</asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="center">
                            <asp:Button ID="btnRegister" runat="server" onclick="btnRegister_Click" 
                                Text="注册" />
                            &nbsp;
                            <asp:Button ID="reset" runat="server" onclick="reset_Click" Text="重置" />
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

