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
                <table>
                    <tr class="formSingleLine">
                        <td class="form_item">被提名人姓名<span class="requiredItem">*</span></td>
                        <td>
                            <input name="name" type="text" class="textBoxSingleLine" maxlength="20" required="required" data-bind="value:name" /></td>
                        <td></td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">被提名人类型<span class="requiredItem">*</span></td>
                        <td>
                            <select name="type" class="textBoxSingleLine" data-bind="value: type">
                                <option value="0">个人</option>
                                <option value="1">团队</option>
                            </select>
                        </td>
                        <td class="form_note">单次提名2人及以上时请选择团体，提名1人请选择个人。</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">TA(们)所在的院系<span class="requiredItem">*</span></td>
                        <td>
                            <select name="department" id="select-dept" class="textBoxSingleLine" data-bind="value: department">
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
                        <td class="form_note">如涉及跨院系团队或提名职工等不适用此项时，请选择前两项</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">TA/TA们是<span class="requiredItem">*</span></td>
                        <td>
                            <select name="intro" class="textBoxSingleLine" data-bind="value: role">
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
                        <td class="form_item">被提名人简介</td>
                        <td>
                            <input name="intro" type="text" class="textBoxSingleLine" data-bind="value: intro" placeholder="请填写被提名人信息（不超过15个字）" maxlength="20" /></td>
                        <td class="form_note">如果被提名人为在校师生，系统会在提交后自动补充"XX系学生/教师"字样</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">TA的联系方式</td>
                        <td>
                            <input name="mobile" type="text" class="textBoxSingleLine" maxlength="20" data-bind="value:tel" /></td>
                        <td class="form_note">仅供工作人员联系被提名人使用</td>
                    </tr>
                    <tr class="formMultipleLine">
                        <td class="form_item">TA(们)的故事<span class="requiredItem">*</span></td>
                        <td>
                            <textarea name="story" class="textBoxMultipleLine" maxlength="150" required="required" data-bind="value:story"></textarea></td>
                        <td class="form_note">请讲述一个你或TA的复旦故事，可以是一件事，也可以是每天发生的事。<br />
                            最好写出故事发生的时间、地点，以及最重要的故事里你或TA的样子~</td>
                    </tr>
                    <tr class="formSingleLine">
                        <td class="form_item">你的联系方式<span class="requiredItem">*</span></td>
                        <td>
                            <input name="mobile" type="text" class="textBoxSingleLine" maxlength="50" required="required" data-bind="value:submitter" /></td>
                        <td class="form_note">仅供工作人员在联系不到被提名人时，联系提名人使用</td>
                    </tr>
                    <tr class="formBtnContainer">
                        <td colspan="2">
                            <div class="form_btn">
                                <input type="submit" id="submit_addname" class="btn btn_submit formBtn" data-bind="click:submit" value="提&nbsp;&nbsp;交" />
                                <div class="btn btn_return formBtn"><a href="<%=Url.Action("Vote","Home") %>">返&nbsp;&nbsp;回</a></div>
                                <div style="clear: both"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script>
        var viewModel = {
            submit: function () {
                if(this.name().trim()==''){alert('被提名人姓名不能为空');return;}
                if (this.story().trim() == '') { alert('TA(们)的故事不能为空'); return; }
                if (this.submitter().trim() == '') { alert('为避免联系不到被提名人，请提供你的联系方式~'); return; }
                var intro=''
                if(this.department!='999'){intro=$('#select-dept').find('option:selected').text();}
                if (this.role != '') {
                    intro += this.role()
                    if (intro != '') { intro = intro + ' ' + this.intro().trim() }
                }
                else {
                    intro = this.intro().trim()
                }
                $.ajax({
                    type: 'POST',
                    url: '<%=Url.Action("AddNameSubmit")%>',
                    data:{
                        name: this.name().trim(),
                        type: this.type(),
                        department:this.department(),
                        role:this.role(),
                        introduction:intro.trim(),
                        tel:this.tel().trim(),
                        story:this.story().trim(),
                        submitter:this.submitter(),

                    },
                    success: function (data) {
                        if (data.success) {
                            alert('提名成功!我们将在24小时内审核你的提名，审核通过后你的提名会出现在投票列表内。')
                            window.location.href='<%=Url.Action("Vote","Home")%>'
                        }
                        else {
                            alert(data.message)
                        }
                    },
                    error: function () {
                        alert('提交失败，请重试')
                    }
                });
            },
            name: ko.observable(''),
            type: ko.observable(0),
            department:ko.observable('000'),
            role:ko.observable('999'),
            intro:ko.observable(''),
            tel:ko.observable(''),
            story:ko.observable(''),
            submitter:ko.observable('')
        };
        
        $(document).ready(function () {
            ko.applyBindings(viewModel)
            
        })
    </script>
</asp:Content>
