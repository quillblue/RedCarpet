﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontMaster.Master" Inherits="System.Web.Mvc.ViewPage<List<hongtan.Models.CandidateModel>>" %>
<%@ Import Namespace="hongtan.Models" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
    <div class="vote_form">
        <form action="VoteSubmit" method="post">
        <%foreach (CandidateModel cm in Model)
          {
              Html.RenderPartial("VoteItem",cm);
          }
        %>
        <div style="clear:both"></div>
        <div class="btn_container">
		    <input type="submit" id="submit_vote" class="btn_submit" value="提&nbsp;&nbsp;交"/>
        </div>
        </form>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="RightPagePlaceHolder" runat="server">
	<div class="right_coloum">
		<div class="right_page_title">
			投票规则
		</div>
		<div class="intro">
			<p>1. 投票期间，每IP每天可参与投票一次，选择不多于5位候选人。</p>
			<p>2. 若想要选择的人选未出现在投票列表中，可选择另行提名。通过审核后该提名将在第二天出现在候选列表中。每次提名数量不限。</p>
			<p>3. 另行提名数量不计入每天可投的票数，也不计入被提名者的得票数。</p>
			<p>4. 如在投票中遇到其他技术问题，请使用复旦邮箱致信stu@fudan.edu.cn。</p>
		</div>
	</div>
	<div class="right_coloum">
		<div class="right_page_title">
			我要提名
		</div>
		<div class="right_form">
		<form action="AddName" method="post">
			<p>被提名人&nbsp;&nbsp;&nbsp;<input name="add_name" class="add_name"></input></p>
			<p>被提名人简介（不超过50字）</p>
			<textarea name="add_intro" class="add_intro" maxlength="70"></textarea>
            <div class="btn_container">
			    <p><input type="submit" class="btn_submit" value="提&nbsp;&nbsp;交"/></p>
            </div>
		</form>
		</div>
	</div>
</asp:Content>
