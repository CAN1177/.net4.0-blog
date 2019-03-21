<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="article.aspx.cs" Inherits="article" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
    <script src="js/ajax.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Del() {
            var id = this.id;
            $.ajax({
                url: "",
                type: "post",
                data: 'id=' + id,
                error: function (data) {
                    alert(data);
                },
                success:function(){
                    
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <br />
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2" class="td">
                    文章页面</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="articleId,username" 
                        DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
                        PageSize="5">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="标题" SortExpression="title">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkTitle" runat="server" 
                                        
                                        Text='<%# Eval("title").ToString().Length>6?Eval("title").ToString().Substring(0,6)+"...":Eval("title").ToString() %>' 
                                        oncommand="lnkTitle_Command" CommandArgument='<%# Eval("articleId") %>' 
                                        Font-Size="12pt"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="内容" SortExpression="content">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkContent" runat="server" 
                                        
                                        Text='<%# Eval("content").ToString().Length>35?Eval("content").ToString().Substring(0,35)+"...":Eval("content").ToString() %>' 
                                        oncommand="lnkContent_Command" CommandArgument='<%# Eval("articleId") %>' 
                                        Font-Size="12pt"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("content") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="username" HeaderText="作者" ReadOnly="True" 
                                SortExpression="username" >
                            <ControlStyle Width="60px" />
                            <HeaderStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="writeTime" HeaderText="发表时间" 
                                SortExpression="writeTime" />
                            <asp:TemplateField HeaderText="操作">
                                <ItemTemplate>
                                    <%--<asp:LinkButton ID="lnkDel" runat="server" 
                                        OnClientClick="return confirm('确认删除吗？');"                               
                                        CommandArgument='<%# Eval("articleId") %>' oncommand="lnkDel_Command" 
                                        Width="50px">删除</asp:LinkButton>--%>
                                        <label id="<%#Eval("articleId") %>" onclick="Del()">删除</a><input type="hidden"  value="<%#Eval("articleId") %>"/>
                                    &nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/Blog.mdb" 
                        
                        SelectCommand="SELECT * FROM [articles] WHERE ([username] = ?) order by writeTime desc">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="添加" onclick="btnAdd_Click" />
&nbsp;<asp:Button ID="btnReset" runat="server" Text="更新" onclick="btnReset_Click" />
                    <br />
                    <br />
                    <asp:Panel ID="Panel1" runat="server" BackColor="ActiveCaption" Height="500px" 
                        Width="570px">
                        <asp:Panel ID="Panel2" runat="server" BackColor="Brown" Height="31px" 
                            Width="570px">
                            <center style="height: 26px">
                                <asp:Label ID="lbEdit" runat="server" Text=""></asp:Label>
                            </center>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" Height="500px" Width="570px">
                <br />
                            标题：<asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <br />
                <br />
                <br />
                            内容：<asp:TextBox ID="txtContent" runat="server" Height="300px" 
                                TextMode="MultiLine" Width="400px"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtContent" ErrorMessage="内容不能为空" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <br />
                            &nbsp;<br /> &nbsp;<asp:Button ID="submit" runat="server" onclick="submit_Click" 
                                Text="提交" />
                            &nbsp;
                            <asp:Button ID="cancel" runat="server" onclick="cancel_Click" Text="取消" />
                            &nbsp;&nbsp;&nbsp;</asp:Panel>
                    </asp:Panel>
                    <br />
                    <asp:HyperLink ID="HyperLink3" runat="server"></asp:HyperLink>
                    <asp:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="HyperLink3" PopupControlID="Panel1" PopupDragHandleControlID="Panel3" BackgroundCssClass="modalBg" runat="server">
                    </asp:ModalPopupExtender>
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

