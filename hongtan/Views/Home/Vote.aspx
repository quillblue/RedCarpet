<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.CandidateModel>>" %>

<%@ Import Namespace="hongtan.Models" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
    <div class="vote_form">
        <form action="VoteSubmit" method="post">
            <%foreach (CandidateModel cm in Model)
              {
                  Html.RenderPartial("VoteItem", cm);
              }
            %>
            <div style="clear: both"></div>
            <div class="btn_container">
                <input type="submit" id="submit_vote" class="btn btn_submit" value="提&nbsp;&nbsp;交" />
            </div>
        </form>
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
            <p>4. 另行提名数量不计入每天可投的票数，也不计入被提名者的得票数。</p>
            <p>5. 若被提名人故事描述欠佳，可点击投票栏“申请更正信息”以申请修改故事描述，修改后描述通过审核后生效</p>
            <p>6. 如在投票中遇到其他技术问题，请使用复旦邮箱致信stu@fudan.edu.cn。</p>
        </div>
        <div id="toolbar">
            <div id="addNameBtn">
                <a href="/AddName">
                    <div class="btn btn_addName">我要提名</div>
                </a>
            </div>
        </div>
        <div class="filterAndSearchBox">
            <div id="filter">
                <select>
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
                <select>
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
            </div>
            <div id="searchBar">
                <input type="text" id="searchInput" name="searchInput" value="" placeholder="页面内搜索" />
                <a onclick="searchSubmit()">
                    <div id="searchSubmit" class="btn btn_searchSubmit">搜索</div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
