<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.CandidateModel>>" %>
<%@ Import Namespace="hongtan.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <%foreach (CandidateModel cm in Model){%>
    <tr>
	    <td class="table_short"><%=Html.Encode(cm.Id) %></td>
	    <td class="table_short"><%=Html.Encode(cm.Name) %></td>
		<td class="table_long"><%=Html.Encode(cm.Introduction) %></td>
		<td class="table_short"><%=Html.Encode(cm.BidCount) %></td>
		<td class="table_short"><%=Html.Encode(cm.Priority) %></td>
		<td class="table_short"><a href="admin/SwitchDisplay/<%=Html.Encode(cm.Id) %>">通过</a>|<a href="admin/Edit/<%=Html.Encode(cm.Id) %>">编辑</a>|<a href="admin/Delete/<%=Html.Encode(cm.Id) %>">删除</a></td>
	</tr>
    <%} %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
审核新提名
</asp:Content>
