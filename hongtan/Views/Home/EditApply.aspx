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
                    <td class="form_item">相关被提名人</td>
                    <td colspan="2"><%=Model.Name +"("+Model.Introduction+")"%></td>
                    <td class="form_note"></td>
                </tr>
                <tr class="formSingleLine">
                    <td class="form_item">你的联系方式<span class="requiredItem">*</span></td>
                    <td><input name="applier_tel" type="text" class="textBoxSingleLine" maxlength="20" required="required"/></td>
                    <td class="form_note">仅供工作人员联系你核实信息使用</td>
                </tr>
                <tr class="formMultipleLine">
                    <td class="form_item">更正的内容与说明<span class="requiredItem">*</span></td>
                    <td><textarea name="reason" class="textBoxMultipleLine" placeholder="指出描述您需要更正的内容，并简要说明原因" required="required"></textarea></td>
                </tr>
                <tr class="formBtnContainer">
                        <td colspan="2">
                            <div class="form_btn">
                                <input type="submit" id="submit_addname" class="btn btn_submit formBtn" value="提&nbsp;&nbsp;交" />
                                <div style="clear: both"></div>
                            </div>
                        </td>
                    </tr>
            </table>
            <input type="hidden" name="relatedId" value="<%=Model.Id %>" />
            <%Html.EndForm(); %>
        </div>
            </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftPagePlaceHolder" runat="server">
</asp:Content>
