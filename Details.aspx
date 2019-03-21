<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
   <br />
    <div id="artTitle">
        <asp:Label ID="Label1" runat="server"></asp:Label></div>
        <br />
    <div id="artContent">
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        </div>
        <div id="artTime"> 
            <br />
            发表时间：<asp:Label ID="lblTime" runat="server"></asp:Label>
        </div>
         <div id="control">
            <br />
            <asp:LinkButton
                ID="back" runat="server" onclick="back_Click">返回</asp:LinkButton>&nbsp;<asp:LinkButton 
                 ID="lnkComment" runat="server">评论</asp:LinkButton>
             <br />
             文章点击次数：<asp:Label ID="Label3" runat="server"></asp:Label>
             <br />

    </div>

</asp:Content>

