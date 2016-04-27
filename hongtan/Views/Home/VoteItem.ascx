<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<hongtan.Models.CandidateModel>" %>

 <div class="vote_card">
	<table class="vote_info">
		<tr class="table_singleline">
			<td colspan="2" id="name_<%=Html.Encode(Model.Id) %>" class="vote_label_name"><%=Html.Encode(Model.Name)%></td>
            <td><a href="EditApply/<%=Model.Id %>">申请更正信息</a></td>
		</tr>
		<tr class="table_singleline">
			<td colspan="3"><%=Html.Encode(Model.Introduction)%></td>
		</tr>
        <tr class="table_multiline">
			<td colspan="3" style="width:420px"><%=Html.Encode(Model.Story)%></td>
		</tr>
        <tr class="table_singleline">
			<td class="vote_label">票数：</td>
			<td class="vote_bidCount"><%=Html.Encode(Model.BidCount)%></td>
			<td><input type="checkbox" name="VoteCheck" value="<%=Html.Encode(Model.Id)%>">投TA一票</input></td>
		</tr>
	</table>						
</div>
