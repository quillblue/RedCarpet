<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.CandidateModel>>" %>

<%@ Import Namespace="hongtan.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TableHolder" runat="server">
    <thead>
        <tr>
            <td>Id</td>
            <td>姓名</td>
            <td>院系</td>
            <td>身份</td>
            <td>类型</td>
            <td>联系方式</td>
            <td>简介</td>
            <td>故事</td>
            <td>查重</td>
            <td>提交人</td>
            <td>操作</td>
        </tr>
    </thead>
    <tbody>
        <%foreach (CandidateModel cm in Model)
          {%>
        <tr>
            <td class="table_short"><%=Html.Encode(cm.Id) %></td>
            <td class="table_short"><%=Html.Encode(cm.Name) %></td>
            <td class="table_short"><%=Html.Encode(cm.Type%10==0?"个人":"团队") %></td>
            <td class="table_short"><%=Html.Encode(cm.Tel) %></td>
            <td class="table_long"><%=Html.Encode(cm.Introduction) %></td>
            <td class="table_short"><%=Html.Encode(cm.Story) %></td>
            <td class="table_short"><%=Html.Encode(cm.BidCount) %></td>
            <td class="table_short"><%=Html.Encode(cm.Priority) %></td>
            <td class="table_short"><a href="admin/SwitchDisplay/<%=Html.Encode(cm.Id) %>">通过</a>|<a href="admin/Edit/<%=Html.Encode(cm.Id) %>">编辑</a>|<a href="admin/Delete/<%=Html.Encode(cm.Id) %>">删除</a></td>

            <td class="table_short">
                <%if (cm.Type > 1)
                  {
                      CandidateRepository cr = new CandidateRepository();
                      CandidateModel cmDuplicated = cr.GetInfoById((int)(cm.Type / 10));
                      String duplicateInfo = "姓名：" + cmDuplicated.Name;
                      duplicateInfo += "&#10;简介：" + cmDuplicated.Introduction;
                      duplicateInfo += "&#10;故事：" + cmDuplicated.Story;
                %>
                <a href="#" title="<%=duplicateInfo %>">疑似</a>
                <%} %>

            </td>
        </tr>
        <%} %>
    </tbody>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    审核新提名
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">
    <script type="text/javascript">
        var newCandidateViewModel = (function (ko) {
            applyList = ko.observableArray([]),
            switchDisplay = function () {

            },
            deleteApply = function (apply) {
                ajaxRequest('post', '<%=Url.Action("Delete")%>', { id: apply.Id }, function (data) {
                    if (data.success) {
                        alert('删除成功')
                        applyList.remove(apply)
                    }
                    else {
                        alert('删除失败，请重试 [' + data.message + ']')
                    }
                })
            },
            loadData = function () {
                ajaxRequest('post', '<%=Url.Action("GetAllEditApply")%>', {}, function (data) {
                    for (var i = 0; i < data.length; i++) {
                        applyList.push(data[i])
                    }
                })
            }
            var viewModel = {
                applyList: applyList,
                switchDisplay:switchDisplay,
                deleteApply: deleteApply,
                _loadData: loadData
            }
            viewModel._loadData()
            return viewModel
            function ajaxRequest(type, url, data, callback) { // Ajax helper this.clearError();
                $.ajax({
                    url: url,
                    data: data,
                    type: type,
                    dataType: "json",
                    context: this,
                    success: callback,
                    error: function () {
                        alert("目前无法与服务器建立通信，请稍后重试");
                    }
                });
            }
        })(ko)
        $(document).ready(function () {
            ko.applyBindings(editApplyViewModel)
        })
    </script>

</asp:Content>
