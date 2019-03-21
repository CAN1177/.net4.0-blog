<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="msgChange.aspx.cs" Inherits="msgChange" %>

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
                信息修改</td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <br />
                <table id="tb_rs">
                    <tr>
                        <td align="right">
                            用户名：<br />
                        </td>
                        <td align="left">
                            <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        </td>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            原密码：</td>
                        <td>
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            当前密码：</td>
                        <td >
                            <asp:TextBox ID="nPwd" runat="server" TextMode="Password"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                      <tr>
                        <td align="right">
                            确认密码：</td>
                        <td>
                            <asp:TextBox ID="cPwd" runat="server" TextMode="Password"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            性别：</td>
                        <td>
                            <asp:RadioButtonList ID="rdioSex" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                     <tr>
                        <td align="right">
                            QQ：</td>
                        <td>
                            <asp:TextBox ID="txtQQ" runat="server"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                        <td align="right">
                            爱好：</td>
                        <td>
                            <asp:TextBox ID="txtHobby" runat="server" Height="120px" TextMode="MultiLine" 
                                Width="240px"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td align="center">
                            <asp:Button ID="reset" runat="server" onclick="reset_Click" Text="修改" />
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

