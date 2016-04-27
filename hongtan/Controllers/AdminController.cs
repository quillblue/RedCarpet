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

        public ActionResult Login() {
            return View();
        }

        [HttpPost]
        public ActionResult LoginSubmit() {
            if (Request.Form["Passwd"] == "Hongtan2015")
            {
                FormsAuthentication.SetAuthCookie("admin", true);
                return Content("<script>location.replace('http://stu.fudan.edu.cn/hongtan/admin/ManageNew');</script>", "text/html");
            }
            else {
                return Content("<script>location.replace('http://stu.fudan.edu.cn/hongtan/admin/Login');</script>", "text/html");
            }
        }

        [Authorize]
        public ActionResult ManageNew()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllHidden();
            return View(NewCanList);
        }

        [Authorize]
        public ActionResult CurrentVote()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllShown();
            return View(NewCanList);
        }

        //[Authorize]
        public ActionResult ManageEditApply() {
            CandidateRepository cr = new CandidateRepository();
            List<EditApplyModel> EditApplyList = cr.GetAllEditApply(); ;
            List<ManageEditApplyDisplayModel> displayList = new List<ManageEditApplyDisplayModel>();
            foreach (EditApplyModel eam in EditApplyList) {
                displayList.Add(new ManageEditApplyDisplayModel(eam));
            }
            return View(displayList);
        }

        //[Authorize]
        public ActionResult Edit(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            return View(cm);
        }

        [Authorize]
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

        [Authorize]
        public ActionResult Delete(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            try
            {
                cr.Delete(id);
                cr.Save();
                return Content("<script>alert('删除成功！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");///to-do
            }
            catch (Exception e) 
            {
                return Content("<script>alert('删除失败，请稍后重试！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }
        }

        [Authorize]
        public ActionResult SwitchDisplay(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            try
            {
                cr.SwitchDisplay(id);
                return Content("<script>alert('操作成功！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('操作失败，请稍后重试！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }
        }

        [Authorize]
        public ActionResult DeleteEditApply(int id) {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                cr.RejectEditApply(id);
                return Content("<script>alert('操作成功！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/ManageEditApply');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('操作失败，请稍后重试！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/ManageEditApply');</script>", "text/html");
            }
            
        }

    }
}
