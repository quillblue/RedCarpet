﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.CandidateModel>>" %>

<%@ Import Namespace="hongtan.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <%foreach (CandidateModel cm in Model)
      {%>
    <tr>
        <td class="table_short"><%=Html.Encode(cm.Id) %></td>
        <td class="table_short"><%=Html.Encode(cm.Name) %></td>
        <td class="table_short"><%=Html.Encode(cm.Type%10==0?"个人":"团队") %></td>
        <td class="table_short"><%=Html.Encode(cm.Tel) %></td>
        <td class="table_long"><%=Html.Encode(cm.Introduction) %></td>
        <td class="table_long"><%=Html.Encode(cm.Story) %></td>
        <td class="table_short"><%=Html.Encode(cm.BidCount) %></td>
        <td class="table_short"><%=Html.Encode(cm.Priority) %></td>
        <td class="table_short"><a href="SwitchDisplay/<%=Html.Encode(cm.Id) %>">隐藏</a>|<a href="Edit/<%=Html.Encode(cm.Id) %>">编辑</a>|<a href="Delete/<%=Html.Encode(cm.Id) %>">删除</a></td>
        
    </tr>
    <%} %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    当前投票情况
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
