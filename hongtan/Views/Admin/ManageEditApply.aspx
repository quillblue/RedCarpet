<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.ManageEditApplyDisplayModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleHolder" runat="server">
信息更正申请管理
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="THeadHolder" runat="server">
    <td width="30px">Id</td>
    <td width="90px">申请人电话</td>
    <td width="200px">更正理由</td>
     <td width="50px">更正条目被提名人</td>
    <td width="90px">操作</td>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentHolder" runat="server">
    <%foreach(hongtan.Models.ManageEditApplyDisplayModel applyEditPair in Model){ %>
        <tr>
            <td class="table_short"><%=Html.Encode(applyEditPair.eam.Id) %></td>
            <td class="table_short"><%=Html.Encode(applyEditPair.eam.ApplierTel) %></td>
            <td class="table_long" ><%=Html.Encode(applyEditPair.eam.ApplyReason) %></td>
            <td class="table_short"><%=Html.Encode(applyEditPair.cm.Name) %></td>
            <td class="table_short"><a href="Edit/<%=Html.Encode(applyEditPair.cm.Id) %>">手工编辑</a> | <a href="DeleteEditApply/<%=Html.Encode(applyEditPair.eam.Id) %>">已处理</a></td>
        </tr>
    <%} %>
</asp:Content>
