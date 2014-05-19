<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<hongtan.Models.CandidateModel>" %>

 <div class="vote_card">
	<table class="vote_info">
		<tr class="table_singleline">
			<td class="vote_label">姓名：</td>
			<td colspan="2"><%=Html.Encode(Model.Name)%></td>
		</tr>
		<tr class="table_multiline">
			<td class="vote_label">简介：</td>
			<td colspan="2"><%=Html.Encode(Model.Introduction)%></td>
		</tr>
			<tr class="table_singleline">
			<td class="vote_label">票数：</td>
			<td class="vote_bidCount"><%=Html.Encode(Model.BidCount)%></td>
			<td><input type="checkbox" name="VoteCheck" value="<%=Html.Encode(Model.Id)%>">投TA一票</input></td>
		</tr>
	</table>						
</div>
