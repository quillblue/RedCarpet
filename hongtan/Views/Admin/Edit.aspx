<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AdminMaster.Master" Inherits="System.Web.Mvc.ViewPage<hongtan.Models.CandidateModel>" %>

<%@ Import Namespace="hongtan.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TableHolder" runat="server">
    <%bool isSuperAdmin = (HttpContext.Current.User.Identity.Name == "Super"); %>
    <tr>
        <td class="form_item">姓名<span class="requiredItem">*</span></td>
        <td>
            <input name="name" type="text" class="form-control" maxlength="20" required="required" data-bind="value: name" /></td>
    </tr>
    <tr>
        <td class="form_item">类型<span class="requiredItem">*</span></td>
        <td>
            <select class="form-control" name="type" data-bind="value: type">
                <option value="0">个人</option>
                <option value="1">团队</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="form_item">院系<span class="requiredItem">*</span></td>
        <td>
            <select name="department" id="select-dept" class="form-control" data-bind="value: department">
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
            <select name="intro" class="form-control" data-bind="value: role">
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
            <input name="intro" type="text" class="form-control" data-bind="value: intro" placeholder="不超过15个字" maxlength="20" /></td>
    </tr>
    <tr>
        <td class="form_item">被提名人联系方式</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="20" data-bind="value: tel" /></td>
    </tr>
    <tr>
        <td class="form_item">故事<span class="requiredItem">*</span></td>
        <td>
            <textarea name="story" class="form-control" maxlength="150" required="required" data-bind="value: story"></textarea></td>
    </tr>
    <tr>
        <td class="form_item">推荐度</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" required="required" data-bind="value: submitter" /></td>
    </tr>
    <tr>
        <td class="form_item">当前票数</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" readonly="readonly" data-bind="value: submitter" /></td>
    </tr>
    <%if(isSuperAdmin){ %>
    <tr>
        <td class="form_item">票数调整值</td>
        <td>
            <input name="mobile" type="text" class="form-control" maxlength="50" required="required" data-bind="value: submitter" /></td>
    </tr>
    <%} %>
    <tr>
        <td colspan="2">
            <div class="form_btn">
                <input type="submit" id="submit_addname" class="btn btn_submit formBtn" data-bind="click: submit" value="提&nbsp;&nbsp;交" />
                <div style="clear: both"></div>
            </div>
        </td>
    </tr>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titleHolder" runat="server">
    编辑用户信息
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHolder" runat="server">

</asp:Content>
