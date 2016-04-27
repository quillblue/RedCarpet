<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<hongtan.Models.CandidateModel>" %>
<%@ Import Namespace="hongtan.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
     <tr>
        <form name="editpanel" action="../Edit" method="post">
	        <td class="table_short"><%=Html.Encode(Model.Id) %></td>
	        <td class="table_short"><input type="text" class="admin_edit_short" name="Edit_Name" value="<%=Html.Encode(Model.Name) %>"></input></td>
            <td class="table_short"><%=Html.Encode(Model.Type==0?"个人":"团队") %></td>
            <td class="table_short"><input type="text" class="admin_edit_short" name="Edit_Tel" value="<%=Html.Encode(Model.Tel) %>"></input></td>          
		    <td class="table_long"><textarea name="Edit_Introduction" style="width:95%"><%=Html.Encode(Model.Introduction) %></textarea></td>
            <td class="table_long"><textarea name="Edit_Story" style="width:95%"><%=Html.Encode(Model.Story) %></textarea></td>
		    <td class="table_short"><%=Html.Encode(Model.BidCount) %></td>
		    <td class="table_short"><input type="text" class="admin_edit_short" name="Edit_Priority" value="<%=Html.Encode(Model.Priority) %>"></input></td>
	        <td class="table_short"><input type="hidden" name="Edit_Id" value="<%=Html.Encode(Model.Id) %>" /><input type="submit"/>|<a href="../CurrentVote">取消</a></td>
        </form>
	</tr>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    编辑用户信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="THeadHolder" runat="server">
    <td width="30px">Id</td>
    <td width="60px">姓名</td>
    <td width="30px">类型</td>
    <td width="90px">联系方式</td>
    <td width="100px">简介</td>
    <td width="150px">故事</td>
    <td width="40px">票数</td>
    <td width="40px">推荐度</td>
    <td width="100px">操作</td>
</asp:Content>
