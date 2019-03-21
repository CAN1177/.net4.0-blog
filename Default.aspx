<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/CSS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .kw
        {
            display: inline;
            /*position: relative;*/
            line-height: 24px;
        }
        .kw input
        {
            z-index: 10;
        }
        .kw_info
        {
            display: inline-block;
            position: absolute;
            left: 3px;
            top: 0px;
            color: #ccc;
            z-index: 1;
            cursor: text;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td class="td" colspan="2">
                最新信息
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
       
                <script type="text/javascript">
                    //                        function check() {
                    //                            var name = document.getElementById("txtName");
                    //                            if (name == null) {
                    //                                alert("不允许为空");
                    //                                var act=document.
                    ////                                name.focus();
                    //                        //                            }
                    //                        }
                    $(function () {
                        $(".kw_info").click(function () {
                            $(this).hide();
                            $(this).siblings("input").focus();
                        });
                        $(".kw input").click(function () {
                            $(this).siblings(".kw_info").hide();
                        });
                        $(".kw input").blur(function () {
                            if ($(this).val() == "") {
                                $(this).siblings(".kw_info").show();
                            }
                        });
                        $(".kw input").each(function (index, item) {
                            if ($(this).val() != "") {
                                $(this).siblings(".kw_info").hide();
                            }
                        });
                    });
                </script>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="标题">
                            <ItemTemplate>
                                <asp:LinkButton ID="Title" runat="server" Font-Underline="False" Text='<%# Eval("title").ToString().Length>6?Eval("title").ToString().Substring(0,6)+"...":Eval("title").ToString() %>'
                                    CommandArgument='<%# Eval("articleId") %>' OnCommand="Title_Command" Width="80px"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="正文">
                            <ItemTemplate>
                                <asp:LinkButton ID="content" runat="server" Font-Underline="False" Text='<%# Eval("content").ToString().Length>90?Eval("content").ToString().Substring(0,90)+"...":Eval("content").ToString() %>'
                                    CommandArgument='<%# Eval("articleId") %>' OnCommand="content_Command"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作者">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>' Width="70px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="发表时间">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("writeTime") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                <div class="search">
                    <asp:LinkButton ID="moreArticles" runat="server" Font-Underline="False" OnClick="moreArticles_Click">更多文章》</asp:LinkButton>
                </div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="wordId" ForeColor="#333333"
                    GridLines="None" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="subject" HeaderText="主题" SortExpression="subject">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="content" HeaderText="内容" SortExpression="content" />
                        <asp:BoundField DataField="username" HeaderText="发言人" SortExpression="username">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="showTime" HeaderText="留言时间" SortExpression="showTime" />
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
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Blog.mdb"
                    SelectCommand="SELECT TOP 5 * FROM [words] ORDER BY [showTime] DESC, [subject]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/Blog.mdb"
                    SelectCommand="SELECT * FROM [words] ORDER BY [showTime] DESC, [subject]"></asp:AccessDataSource>
                <br />
                <div class="search">
                    <asp:LinkButton ID="lnkBtnWords" runat="server" Font-Underline="False" OnClick="moreWords_Click">更多留言》</asp:LinkButton>
                </div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
