<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TableHolder" runat="server">
    <%bool isSuperAdmin = (HttpContext.Current.User.Identity.Name == "Super"); %>
    <tr>
        <td class="form_item">姓名<span class="requiredItem">*</span></td>
        <td>
            <input name="name" type="text" class="form-control" maxlength="20" required="required" data-bind="value: Name" /></td>
    </tr>
    <tr>
        <td class="form_item">类型<span class="requiredItem">*</span></td>
        <td>
            <select class="form-control" name="type" data-bind="value: Type">
                <option value="0">个人</option>
                <option value="1">团队</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="form_item">院系<span class="requiredItem">*</span></td>
        <td>
            <select name="department" id="select-dept" class="form-control" data-bind="value: Department">
                <option value="999">N/A（TA们来自不同院系）</option>
                <option value="999">N/A（TA不是师生或校友）</option>
                <option value="001">马克思主义学院</option>
                <option value="010">古籍所</option>
                <option value="011">中文系</option>
                <option value="012">外文学院</option>
                <option value="013">新闻学院</option>
                <option value="014">历史学系</option>
                <option value="016">哲学学院</option>
                <option value="017">国关学院</option>
                <option value="018">数学学院</option>
                <option value="019">物理学系</option>
                <option value="020">核物理系(现代物理研究所)</option>
                <option value="022">化学系</option>
                <option value="024">计算机学院</option>
                <option value="027">法学院</option>
                <option value="029">力学系</option>
                <option value="030">材料系</option>
                <option value="037">分析测试中心</option>
                <option value="044">高分子系</option>
                <option value="046">高教所</option>
                <option value="050">旅游学系</option>
                <option value="054">文博系</option>
                <option value="068">经济学院</option>
                <option value="069">管理学院</option>
                <option value="070">生命科学学院</option>
                <option value="072">信息学院</option>
                <option value="073">社政学院</option>
                <option value="074">环境系</option>
                <option value="076">史地所</option>
                <option value="080">国际文化交流学院</option>
                <option value="083">文献信息中心</option>
                <option value="101">基础医学院</option>
                <option value="102">公共卫生学院</option>
                <option value="103">药学院</option>
                <option value="113">肿瘤研究所</option>
                <option value="114">放射医学研究所</option>
                <option value="117">护理学院</option>
                <option value="120">临床医学院</option>
                <option value="151">生物医学研究院</option>
                <option value="152">脑科学研究院</option>
                <option value="201">软件学院</option>
                <option value="301">先进材料实验室</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="form_item">身份<span class="requiredItem">*</span></td>
        <td>
            <select name="intro" class="form-control" data-bind="value: Role">
                <option value="本科毕业生">本科毕业生</option>
                <option value="硕士毕业生">硕士毕业生</option>
                <option value="博士毕业生">博士毕业生</option>
                <option value="教师">教师</option>
                <option value="辅导员">辅导员</option>
                <option value="职工">职工</option>
                <option value="校友">校友</option>
                <option value="">以上都不是</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="form_item">简介</td>
        <td>
            <input name="intro" type="text" class="form-control" data-bind="value: Introduction" placeholder="不超过15个字" maxlength="20" /></td>
    </tr>
    <tr>
        <td class="form_item">被提名人联系方式</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="20" data-bind="value: Tel" /></td>
    </tr>
    <tr>
        <td class="form_item">故事<span class="requiredItem">*</span></td>
        <td>
            <textarea name="story" class="form-control" maxlength="150" required="required" data-bind="value: Story"></textarea></td>
    </tr>
    <tr>
        <td class="form_item">推荐度</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" required="required" data-bind="value: Priority" /></td>
    </tr>
    <%if(isSuperAdmin){ %>
    <tr>
        <td class="form_item">当前票数</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" readonly="readonly" data-bind="value: BidCount" /></td>
    </tr>
    <tr>
        <td class="form_item">增加票数（可为负）</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" required="required" data-bind="value: Note" /></td>
    </tr>
    <%} %>
    <tr>
        <td colspan="2">
            <div class="form_btn">
                <input type="submit" id="submit_addname" class="btn btn-primary" data-bind="click: editSubmit" value="提&nbsp;&nbsp;交" />
                <div style="clear: both"></div>
            </div>
        </td>
    </tr>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    编辑提名信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">
    <script>
        var editCandidateView = (function (ko) {
            Id=ko.observable(0)
            Name = ko.observable(''),
            Type = ko.observable(0),
            Department = ko.observable('000'),
            Role = ko.observable('000'),
            Introduction = ko.observable(''),
            Story = ko.observable(''),
            Tel = ko.observable(''),
            Priority = ko.observable(0),
            BidCount = ko.observable(0),
            Note = ko.observable(0)
            editSubmit = function () {
                if(Name().trim()==""){alert('姓名不能为空，请修改');return;}
                if(Introduction().trim()==""){alert('简介不能为空，请修改');return;}
                if(Story().trim()==""){alert('故事不能为空，请修改');return;}
                if(isNaN(parseFloat(Priority()))){alert('推荐度需要为数字，请修改');return;}
                if(isNaN(parseFloat(Note()))){alert('需要为数字，请修改');return;}
                ajaxRequest('post', '<%=Url.Action("Edit")%>', {Id:Id, Name:Name, Type:Type, Department:Department, Role:Role, Introduction:Introduction, Story:Story, Tel:Tel, Priority:Priority,note:Note}, function (data) {
                    if(data.success){
                        alert('修改成功!')
                        window.location.href='<%=Url.Action("ManageNew","Admin")%>'
                    }
                    else{
                        alert('修改失败，请重试。错误信息'+data.message)
                    }
                })
            }
            loadData = function () {
                ajaxRequest('post', '<%=Url.Action("GetEditBase")%>', {Id:<%=ViewData["Id"]%> }, function (data) {
                    Id(<%=ViewData["Id"]%>)
                    Name(data.Name)
                    Type(data.Type)
                    Department(data.Department)
                    Role(data.Role)
                    Introduction(data.Introduction)
                    Story(data.Story)
                    Tel(data.Tel)
                    Priority(data.Priority)
                    BidCount(data.BidCount)
                    Note(data.BidAdjust)
                })
            }
            var viewModel = {
                Id: Id,
                Name: Name,
                Type: Type,
                Department: Department,
                Role: Role,
                Introduction: Introduction,
                Story: Story,
                Tel:Tel,
                Priority:Priority,
                BidCount:BidCount,
                Note:Note,
                editSubmit:editSubmit,
                _loadData:loadData

            }
            viewModel._loadData()
            return viewModel;
            function ajaxRequest(type, url, data, callback) { // Ajax helper this.clearError();
                $.ajax({
                    url: url,
                    data: data,
                    type: type,
                    dataType: "json",
                    context: this,
                    success: callback,
                    error: function () {
                        alert("Could not finish the request now : Server error.");
                    }
                });
            }
        })(ko)
        $(document).ready(function () {
            ko.applyBindings(editCandidateView)
        })
    </script>
</asp:Content>
