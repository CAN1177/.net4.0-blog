<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="articleDetail.aspx.cs" Inherits="Admin_articleDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
             <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="return confirm('确认要删除吗？');" onclick="lnkDel_Click">删除</asp:LinkButton>
&nbsp;<asp:LinkButton
                ID="back" runat="server" onclick="back_Click">返回</asp:LinkButton></div>
</asp:Content>

