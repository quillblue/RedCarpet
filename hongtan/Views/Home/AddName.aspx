<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.ManageEditApplyDisplayModel>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="UpperPagePlaceHolder" runat="server">
    <div class="rule">
        <div class="formContainer">

            <div class="right_page_title">
                添加新提名
            </div>
            <div class="intro">
                <p>提名面向范围：全校本科、硕士、博士毕业生，全校教职工，及其他与复旦毕业生相关人士，可以为自己或他人。</p>
                <p>提名前请在投票页搜索确认被提名人未曾被提名。</p>
            </div>
            <div class="intro">
                <%Html.BeginForm("AddNameSubmit", "Home");%>
                <table>
                    <tr class="formSingleLine">
                        <td class="form_item">被提名人姓名<span class="requiredItem">*</span></td>
                        <td>
                            <input name="name" type="text" class="textBoxSingleLine" maxlength="20" required="required" /></td>
                        <td></td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">被提名人类型<span class="requiredItem">*</span></td>
                        <td>
                            <input type="radio" name="type" value="0" checked="checked" />个人
                            <input type="radio" name="type" value="1" />团队</td>
                        <td class="form_note">单次提名2人及以上时请选择团体，提名1人请选择个人。</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">TA所在的院系<span class="requiredItem">*</span></td>
                        <td>
                            <select name="department" class="textBoxSingleLine">
                                <option value="999">N/A</option>
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
                        <td class="form_note">请选择被提名人所在院系，如不适用此项，请选择“N/A”</td>
                    </tr>
                     <tr class="formSingleLine">
                        <td class="form_item">TA是一名<span class="requiredItem">*</span></td>
                        <td>
                            <select name="intro" class="textBoxSingleLine">
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
                        <td class="form_note"></td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">被提名人简介<span class="requiredItem">*</span></td>
                        <td>
                            <input name="intro" type="text" class="textBoxSingleLine" placeholder="请填写被提名人信息（不超过15个字）" maxlength="20" required="required" /></td>
                        <td class="form_note">如XX社团社长等</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">TA的联系方式</td>
                        <td>
                            <input name="mobile" type="text" class="textBoxSingleLine" maxlength="20" /></td>
                        <td class="form_note">仅供工作人员联系被提名人使用</td>
                    </tr>
                    <tr class="formMultipleLine">
                        <td class="form_item">TA与复旦的故事<span class="requiredItem">*</span></td>
                        <td>
                            <textarea name="story" class="textBoxMultipleLine" maxlength="150" required="required"></textarea></td>
                        <td class="form_note">请讲述一个你或TA的复旦故事，可以是一件事，也可以是每天发生的事。<br />
                            最好写出故事发生的时间、地点，以及最重要的故事里你或TA的样子~</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">你的联系方式</td>
                        <td>
                            <input name="mobile" type="text" class="textBoxSingleLine" maxlength="20" required="required"/></td>
                        <td class="form_note">仅供工作人员在联系不到被提名人时，联系提名人使用</td>
                    </tr>
                    <tr class="formBtnContainer">
                        <td colspan="2">
                            <div class="form_btn">
                                <input type="submit" id="submit_addname" class="btn btn_submit formBtn" value="提&nbsp;&nbsp;交" />
                                <div class="btn btn_return formBtn"><a href="/hongtan/">返&nbsp;&nbsp;回</a></div>
                                <div style="clear: both"></div>
                            </div>
                        </td>
                    </tr>
                </table>
                <%Html.EndForm(); %>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>