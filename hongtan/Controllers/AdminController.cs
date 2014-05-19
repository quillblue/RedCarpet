using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using hongtan.Models;

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

        [Authorize]
        public ActionResult ManageNew()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllHidden();
            return View(NewCanList);
        }

        public ActionResult CurrentVote()
        {
            CandidateRepository cr = new CandidateRepository();
            List<CandidateModel> NewCanList = cr.GetAllShown();
            return View(NewCanList);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            CandidateRepository cr = new CandidateRepository();
            CandidateModel cm = cr.GetInfoById(id);
            return View(cm);
        }

        [HttpPost]
        public ActionResult Edit()
        {
            try
            {
                CandidateRepository cr = new CandidateRepository();
                CandidateModel cm = new CandidateModel();
                cm.Id = Convert.ToInt32(Request.Form["Edit_Id"]);
                cm.Name = Request.Form["Edit_Name"];
                cm.Introduction = Request.Form["Edit_Introduction"];
                cm.Priority = Convert.ToInt32(Request.Form["Edit_Priority"]);
                cr.Update(cm);
                return Content("<script>alert('操作成功！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('操作失败，请稍后重试！');location.replace('http://stu.fudan.edu.cn/hongtan/admin/');</script>", "text/html");
            }

        }

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

    }
}
