<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aboutMe.aspx.cs" Inherits="aboutMe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table class="tb" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            </td>
            <td class="td">
                基本资料
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <br />
    <table class="tb_am" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right">
                用户名：
            </td>
            <td>
                <asp:Label ID="lblName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                性别：
            </td>
            <td>
                <asp:Label ID="lblSex" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                QQ:
            </td>
            <td>
                <asp:Label ID="lblQQ" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                爱好：
            </td>
            <td>
                <asp:Label ID="lblHobby" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                身份：
            </td>
            <td>
                <asp:Label ID="lblIdentify" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                注册时间：
            </td>
            <td>
                <asp:Label ID="lblTime" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
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

