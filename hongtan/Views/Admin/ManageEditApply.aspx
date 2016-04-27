<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.ManageEditApplyDisplayModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleHolder" runat="server">
信息更正申请管理
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="THeadHolder" runat="server">
    <td width="30px">Id</td>
    <td width="90px">申请人电话</td>
    <td width="200px">更正理由</td>
     <td width="50px">更正条目被提名人</td>
    <td width="70px">操作</td>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentHolder" runat="server">
    <%foreach(hongtan.Models.ManageEditApplyDisplayModel applyEditPair in Model){ %>
        <tr>
            <td class="table_short" rowspan="2"><%=Html.Encode(applyEditPair.eam.Id) %></td>
            <td class="table_short" rowspan="2"><%=Html.Encode(applyEditPair.eam.ApplierTel) %></td>
            <td class="table_long" rowspan="2"><%=Html.Encode(applyEditPair.eam.ApplyReason) %></td>
            <td class="table_short" <%if(!applyEditPair.nameChanged){ %>rowspan="2"<%} %>><%=Html.Encode(applyEditPair.cm.Name) %></td>
            <td class="table_short" rowspan="2"><a href="Edit/<%=Html.Encode(applyEditPair.cm.Id) %>">手工编辑</a><br /><a href="AcceptEditApply/<%=Html.Encode(applyEditPair.eam.Id) %>">采纳</a>|<a href="DeleteEditApply/<%=Html.Encode(applyEditPair.eam.Id) %>">删除</a></td>
        </tr>
    <%} %>
</asp:Content>
