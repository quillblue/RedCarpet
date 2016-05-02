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

        //[Authorize]
        public ActionResult ManageNew()
        {
            return View();
        }

        //[Authorize]
        public ActionResult CurrentVote()
        {
            return View();
        }

        //[Authorize]
        public ActionResult ManageEditApply()
        {
            return View();
        }

        //[Authorize]
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

        //[Authorize]
        [HttpPost]
        public ActionResult GetCurrentVote()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllShown();
            return Json(NewCanList);
        }

        //[Authorize]
        [HttpPost]
        public ActionResult GetAllNewCandidate()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllHidden();
            return Json(NewCanList);
        }

       

        //[Authorize]
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

        //[Authorize]
        public ActionResult Edit(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            return View(cm);
        }

        //[Authorize]
        [HttpPost]
        public ActionResult Edit()
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                CandidateModel cm = new CandidateModel();
                cm.Id = Convert.ToInt32(Request.Form["Edit_Id"]);
                cm.Name = Request.Form["Edit_Name"];
                cm.Tel = Request.Form["Edit_Tel"];
                cm.Introduction = Request.Form["Edit_Introduction"];
                cm.Story = Request.Form["Edit_Story"];
                cm.Priority = Convert.ToInt32(Request.Form["Edit_Priority"]);
                cr.Update(cm);
                return Content("<script>alert('操作成功！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('操作失败，请稍后重试！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }

        }

        //[Authorize]
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

        // [Authorize]
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

        //[Authorize]
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

    }
}
