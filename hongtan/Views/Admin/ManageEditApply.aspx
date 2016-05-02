<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titleHolder" runat="server">
    信息更正申请管理
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="TableHolder" runat="server">
    <thead>
        <tr>
            <td>Id</td>
            <td>申请人电话</td>
            <td>更正理由</td>
            <td>更正条目被提名人</td>
            <td>操作</td>
        </tr>
    </thead>
    <tbody data-bind="foreach: applyList">
        <tr>
            <td class="table_short" data-bind="text: eam.Id"></td>
            <td class="table_short" data-bind="text: eam.ApplierTel"></td>
            <td class="table_long" data-bind="text: eam.ApplyReason"></td>
            <td class="table_short" data-bind="text: cm.Name"></td>
            <td class="table_short"><a class="btn btn-xs btn-primary" data-bind="attr: { href: 'Edit/' + cm.Id }">手工编辑</a>  <a class="btn btn-xs btn-danger" data-bind="    click: function (data,event) { $parent.deleteApply($data) }">已处理</a></td>
        </tr>
    </tbody>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptHolder" runat="server">
    <script>
        var editApplyViewModel = (function (ko) {
            applyList = ko.observableArray([]),
            deleteApply = function (apply) {
                ajaxRequest('post', '<%=Url.Action("DeleteEditApply")%>', { id: apply.eam.Id }, function (data) {
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
