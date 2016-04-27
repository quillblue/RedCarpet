using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hongtan.Models;

namespace hongtan.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Vote/

        public ActionResult Vote()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> canList = cr.GetAllShown();
            return View(canList);
        }

        public ActionResult VoteSubmit()
        {
            string IP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(IP))
            {
                IP = Request.ServerVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(IP))
            {
                IP = Request.UserHostAddress;
            }
            String[] VoteCon = Request.Form["VoteCheck"].Split(',');
            if (VoteCon.Count() > 5)
            {
                return Content("<script>alert('您选择了超过5位候选人，本次投票无效！');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
            DateTime date = DateTime.Now.Date;
            bidRepository br = new bidRepository();
            CandidateRepository cr = new CandidateRepository();
            if (!br.CheckDuplicate(IP, date))
            {
                return Content("<script>alert('您今天已经投过票了！');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
            try
            {
                BidModel bm = new BidModel();
                bm.VoterIP = IP;
                bm.VoteDate = DateTime.Now.Date;
                bm.VoteTime = DateTime.Now;
                bm.VoteContent = Request.Form["VoteCheck"];
                foreach (String s in VoteCon)
                {
                    cr.BeVoted(Convert.ToInt32(s));
                }
                br.Insert(bm);
                br.Save();
                return Content("<script>alert('投票成功！');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('投票失败，请稍后重试。错误信息：" + e.Message.ToString() + "');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
        }

        [HttpGet]
        public ActionResult AddName()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNameSubmit(CandidateModel cm)
        {
            try
            {
                cm.BidCount = 0;
                cm.Hidden = 1;
                cm.Priority = 0;
                cm.BidAdjust = 0;
                CandidateRepository cr = new CandidateRepository();
                int duplicateId = cr.CheckDuplicate(cm);
                if (duplicateId == -2) { return Json(new { success = false, message="提名失败，被提名对象已经存在。如果在投票页面上没有见到，可能处于审核状态。" }); }
                if (duplicateId != -1)
                {
                    cm.Type = cm.Type + 10 * duplicateId;
                }
                cr.Insert(cm);
                cr.Save();
                return Json(new { success = true});
            }
            catch (Exception e)
            {
                return Json(new { success=false,message=e.Message});
            }

        }

        public ActionResult EditApply(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            return View(cm);
        }

        [HttpPost]
        public ActionResult EditApplySubmit()
        {
            try
            {
                EditApplyModel eam = new EditApplyModel();
                eam.ApplierTel = Request.Form["applier_tel"];
                eam.ApplyReason = Request.Form["reason"];
                eam.RelatedCandidateId = Convert.ToInt32(Request.Form["relatedId"]);
                CandidateRepository cr = new CandidateRepository();
                cr.ApplyEdit(eam);
                return Content("<script>alert('申请成功，我们将根据您提供的信息更新相关页面，感谢您的参与！');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('提交失败，请稍后重试。错误信息：" + e.Message.ToString() + "');location.replace('http://stu.fudan.edu.cn/hongtan/');</script>", "text/html");
            }
        }
    }
}
