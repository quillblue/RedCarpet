<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontMaster.Master" Inherits="System.Web.Mvc.ViewPage<hongtan.Models.CandidateModel>" %>



<asp:Content ID="Content2" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="UpperPagePlaceHolder" runat="server">
<div class="rule">
        <div class="formContainer">
         
        <div class="right_page_title">
            申请信息更正
        </div>
        <div class="intro">
            <%Html.BeginForm("EditApplySubmit", "Home"); %>
            <table>
                <tr class="formSingleLine">
                    <td class="form_item">你的联系方式<span class="requiredItem">*</span></td>
                    <td><input name="applier_tel" type="text" class="textBoxSingleLine" maxlength="20" required="required"/></td>
                    <td class="form_note">仅供工作人员联系你核实信息使用</td>
                </tr>
                <tr class="formMultipleLine">
                    <td class="form_item">更正的内容与说明</td>
                    <td><textarea name="reason" class="textBoxMultipleLine" placeholder=""></textarea></td>
                    <td class="form_note">阐述需要更正内容与理由</td>
                </tr>
            </table>
            <%Html.EndForm(); %>
        </div>
            </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
</asp:Content>
