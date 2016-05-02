<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontMaster.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
    <div class="vote_form">
        <div data-bind="foreach: voteList">
            <div class="vote_card" data-bind="visible: isMatched(Department, Role, Name)">
                <table class="vote_info">
                    <tr class="table_singleline">
                        <td colspan="2" data-bind="attr: { id: 'name_' + Id }" class="vote_label_name"><span data-bind="    text: Name"></span></td>
                        <td><a data-bind="attr: { href: 'EditApply/' + Id }">申请更正信息</a></td>
                    </tr>
                    <tr class="table_singleline">
                        <td colspan="3" data-bind="text: Introduction"></td>
                    </tr>
                    <tr class="table_multiline">
                        <td colspan="3" style="width: 420px" data-bind="text: Story"></td>
                    </tr>
                    <tr class="table_singleline">
                        <td class="vote_label">票数：</td>
                        <td class="vote_bidCount" data-bind="text: BidCount"></td>
                        <td>
                            <input type="checkbox" name="VoteCheck" data-bind="value: Id">投TA一票</input></td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="clear: both"></div>
        <div class="btn_container">
            <input type="submit" id="submit_vote" class="btn btn_submit" value="提&nbsp;&nbsp;交" data-bind="click: voteSubmit" />
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="UpperPagePlaceHolder" runat="server">
    <div class="rule">
        <div class="right_page_title">
            投票规则
        </div>
        <div class="intro">
            <p>1. 提名投票开放时间：2016年5月8日20:16 至 2015年5月22日24:00</p>
            <p>2. 投票期间，每IP每天可参与投票一次，选择不多于5位候选人。</p>
            <p>3. 若想要选择的人选未出现在投票列表中，可选择另行提名。通过审核后该提名将在第二天出现在候选列表中。每次提名数量不限。</p>
            <p>4. 若需更正被提名人相关信息，可点击投票栏“申请更正信息”以申请修改，通过审核后修改生效</p>
            <p>5. 如在投票中遇到其他技术问题，请使用复旦邮箱致信stu@fudan.edu.cn。</p>
        </div>
        <div id="toolbar">
            <div id="addNameBtn">
                <a href="/AddName">
                    <div class="btn btn_addName">我要提名</div>
                </a>
            </div>
        </div>

        <div class="searchbar">
            <div class="searchbar_title">
                搜索已有提名
            </div>
            <div class="searchbar_input">
                院系：
                <select class="search_input" data-bind="value: departmentSelect">
                    <option value="000">全部院系</option>
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
                    <option value="999">其他</option>
                </select>
                类型：
                <select class="search_input" data-bind="value: roleSelect">
                    <option value="000">不限</option>
                    <option value="本科毕业生">本科毕业生</option>
                    <option value="硕士毕业生">硕士毕业生</option>
                    <option value="博士毕业生">博士毕业生</option>
                    <option value="教师">教师</option>
                    <option value="辅导员">辅导员</option>
                    <option value="职工">职工</option>
                    <option value="校友">校友</option>
                    <option value="其他">其他</option>
                </select>
                姓名：
                <input type="text" class="search_input" data-bind="value: searchName" />
                <button class="btn btn_searchSubmit">搜索</button>&nbsp;&nbsp;
                <button class="btn btn_searchSubmit" data-bind="click: reset">清空筛选</button>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script>
        var voteViewModel = (function (ko) {
            voteList = ko.observableArray([]),
            departmentSelect = ko.observable('000'),
            roleSelect = ko.observable('000'),
            searchName = ko.observable(''),
            reset = function () {
                departmentSelect('000')
                roleSelect('000')
                searchName('')
            }
            voteSubmit = function () {
                var votedItems = []
                var checkBoxList = $('input[name="VoteCheck"]')
                for (var i = 0; i < checkBoxList.length; i++) {
                    if (checkBoxList[i].checked) {
                        votedItems.push(checkBoxList[i].value)
                    }
                }
                if (votedItems.length > 5) {
                    alert('单次投票不能选择超过5位候选人！'); return;
                }
                ajaxRequest('post', '<%=Url.Action("VoteSubmit")%>', {voteCheck:votedItems.toString()}, function (data) {
                    if (data.success) {
                        alert('投票成功！')
                        location.reload()
                    }
                    else {
                        alert(data.message)
                    }
                })

            },
            isMatched = function (dept, role, name) {
                if (departmentSelect() != '000' && departmentSelect() != dept) { return false; }
                if (roleSelect() != '000' && roleSelect() != role) { return false; }
                if (searchName().trim() != '' && name.indexOf(searchName()) == -1) { return false; }
                return true;
            }
            loadData = function () {
                ajaxRequest('post', '<%=Url.Action("GetVoteList")%>', {}, function (data) {
                    for (var i = 0; i < data.length; i++) {
                        voteList.push(data[i])
                    }
                })
            }
            var viewModel = {
                voteList: voteList,
                departmentSelect: departmentSelect,
                roleSelect: roleSelect,
                searchName: searchName,
                reset: reset,
                voteSubmit: voteSubmit,
                isMatched: isMatched,
                _loadData: loadData
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
            ko.applyBindings(voteViewModel)
        })
    </script>
</asp:Content>
