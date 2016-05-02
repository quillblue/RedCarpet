<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage" %>

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
    <tbody data-bind="foreach:applyList">
        <tr>
            <td class="table_short" data-bind="text:Id"></td>
            <td class="table_short" data-bind="text: Name"></td>
            <td class="table_short" data-bind="text: Department"></td>
            <td class="table_short" data-bind="text: Role"></td>
            <td class="table_short" data-bind="text: Type%10==0?'个人':'团队'"></td>
            <td class="table_short" data-bind="text: Tel"></td>
            <td class="table_long" data-bind="text: Introduction"></td>
            <td class="table_short" data-bind="text: Story"></td>
             <td class="table_short">
                <div data-bind="visible: Type > 1">
                    <a href="#" data-bind="attr: { title: getDuplicatedInfo(Type) }">疑似</a>
                </div>
            </td>
            <td class="table_short" data-bind="text: Submitter"></td>
            <td class="table_short">
                <a data-bind="click: function (data, event) { $parent.switchDisplay($data)}" class="btn btn-xs btn-primary">通过</a> 
                <a data-bind="attr:{href:'admin/Edit/'+Id}" class="btn btn-xs btn-warning">编辑</a>  
                <a data-bind="click: function (data, event) { $parent.deleteApply($data)}" class="btn btn-xs btn-danger">删除</a>
            </td>
        </tr>
    </tbody>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    审核新提名
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">
    <script type="text/javascript">
        var newCandidateViewModel = (function (ko) {
            applyList = ko.observableArray([]),
            switchDisplay = function (apply) {
                ajaxRequest('post', '<%=Url.Action("SwitchDisplay")%>', { id: apply.Id }, function (data) {
                    if (data.success) {
                        alert('操作成功')
                        applyList.remove(apply)
                    }
                    else {
                        alert('操作失败，请重试 [' + data.message + ']')
                    }
                })
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
                ajaxRequest('post', '<%=Url.Action("GetAllNewCandidate")%>', {}, function (data) {
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
            ko.applyBindings(newCandidateViewModel)
        })
    </script>

</asp:Content>
