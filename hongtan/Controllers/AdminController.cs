using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hongtan.Models;
using System.Web.Security;

namespace hongtan.Controllers
{
    public class AdminController : Controller
    {
        #region Login
        //
        // GET: /Admin/
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginSubmit()
        {
            if (Request.Form["Passwd"] == "Hongtan2016")
            {
                FormsAuthentication.SetAuthCookie("admin", true);
                return Content("<script>location.replace('"+Url.Action("ManageNew","Admin")+"');</script>", "text/html");
            }
            if (Request.Form["Passwd"] == "ArtTroupe503")
            {
                FormsAuthentication.SetAuthCookie("Super", true);
                return Content("<script>location.replace('" + Url.Action("ManageNew", "Admin") + "');</script>", "text/html");
            }
            else
            {
                return Content("<script>location.replace('" + Url.Action("Login", "Admin") + "');</script>", "text/html");
            }
        }
        #endregion

        #region PageView
        [Authorize]
        public ActionResult ManageNew()
        {
            return View();
        }

        [Authorize]
        public ActionResult CurrentVote()
        {
            return View();
        }

        [Authorize]
        public ActionResult ManageEditApply()
        {
            return View();
        }

        [Authorize]
        [HongtanAuth(Roles="Super")]
        public ActionResult AntiCheat() {
            return View();
        }
        #endregion

        #region Mangement Operations
        [Authorize]
        [HttpPost]
        public ActionResult GetInfoById(int id) {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            if (cr != null)
            {
                return Json(new { success = true, result = cm });
            }
            else {
                return Json(new { success = false });
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult GetCurrentVote()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllShown();
            return Json(NewCanList);
        }

        [Authorize]
        [HttpPost]
        public ActionResult GetAllNewCandidate()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllHidden();
            return Json(NewCanList);
        }


        [Authorize]
        public ActionResult GetAllEditApply()
        {
            CandidateRepository cr = new CandidateRepository();
            List<EditApplyModel> EditApplyList = cr.GetAllEditApply(); ;
            List<ManageEditApplyDisplayModel> displayList = new List<ManageEditApplyDisplayModel>();
            foreach (EditApplyModel eam in EditApplyList)
            {
                displayList.Add(new ManageEditApplyDisplayModel(eam));
            }
            return Json(displayList);
        }

        [Authorize]
        public ActionResult Edit(int id)
        {
            ViewData["id"] = id;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult GetEditBase(int id) {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            if (HttpContext.User.Identity.Name != "Super") { cm.BidAdjust = 0; }
            return Json(cm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Edit(CandidateModel cm, int note=0)
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                cr.Update(cm);
                if (HttpContext.User.Identity.Name == "Super" && note != 0) {
                    cr.BeAdjusted(cm.Id, note);
                }
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false,message=e.Message });
            }

        }

        [Authorize]
        [HttpPost]
        public ActionResult Delete(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            try
            {
                cr.Delete(id);
                cr.Save();
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, message = e.Message });
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult SwitchDisplay(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            try
            {
                cr.SwitchDisplay(id);
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, message = e.Message });
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult DeleteEditApply(int id)
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                cr.RejectEditApply(id);
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, message = e.Message });
            }
        }
        #endregion

        #region AntiCheat Module
        [HongtanAuth(Roles = "Super")]
        [HttpPost]
        public ActionResult CheckCheatBids(int topCount, int configA=500, int configB=100, int configC=100) {
            CandidateRepository cr = new CandidateRepository();
            IEnumerable<int> topCandidateIds = cr.GetTopCandidates(topCount);
            AntiCheat ac = new AntiCheat(configA, configB, configC);
            foreach(int candidateId in topCandidateIds){
                ac.CheckVoteByCandidate(candidateId);
            }
            return null;
        }

        [HongtanAuth(Roles = "Super")]
        [HttpPost]
        public ActionResult CheckCheatBidsByCandidateId(int candidateId, int configA = 500, int configB = 100, int configC = 100)
        {
            AntiCheat ac = new AntiCheat(configA, configB, configC);
            ac.CheckVoteByCandidate(candidateId);
            return null;
        }

        [HongtanAuth(Roles = "Super")]
        [HttpPost]
        public ActionResult WithdrawCheatedBids(int candidateId=0) {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                bidRepository br = new bidRepository();
                IEnumerable<BidModel> bidList = br.GetCheatBidsByCandidateId(candidateId);
                foreach (BidModel bid in bidList)
                {
                    String[] relatedCandidates = bid.VoteContent.Split(',');
                    foreach (string candidateIdString in relatedCandidates) {
                        cr.RelatedVoteIsWithdrawed(Convert.ToInt32(candidateIdString));
                    }
                    br.DeleteVoteById(bid.Id);
                }
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, message = e.Message });
            }
        }

        [HongtanAuth(Roles = "Super")]
        [HttpPost]
        public ActionResult ReVerifyChecks(int candidateId = 0)
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                bidRepository br = new bidRepository();
                if (candidateId == 0)
                {
                    IEnumerable<int> candidateList = cr.GetAllCandidates();
                    foreach (int cId in candidateList) {
                        br.UpdateVoteStatusByCandidateId(cId, 0);
                    }
                }
                else
                {
                    br.UpdateVoteStatusByCandidateId(candidateId, 0);
                }
                return Json(new {success=true});
            }
            catch (Exception e) {
                return Json(new { success = false, message = e.Message });
            }
        }

        [HongtanAuth(Roles = "Super")]
        [HttpPost]
        public ActionResult ForgiveBidsByCandidate(int candidateId = 0)
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                bidRepository br = new bidRepository();
                if (candidateId == 0)
                {
                    IEnumerable<int> candidateList = cr.GetAllCandidates();
                    foreach (int cId in candidateList)
                    {
                        br.UpdateVoteStatusByCandidateId(cId, 2);
                    }
                }
                else
                {
                    br.UpdateVoteStatusByCandidateId(candidateId, -1);
                }
                return Json(new { success = true });
            }
            catch (Exception e)
            {
                return Json(new { success = false, message = e.Message });
            }
        }
        
        #endregion
    }
}
