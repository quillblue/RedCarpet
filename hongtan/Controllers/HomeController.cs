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

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Vote()
        {
            string IP = "";
            DateTime date = DateTime.Now.Date;
            bidRepository br = new bidRepository();
            CandidateRepository cr = new CandidateRepository();
            if(!br.CheckDuplicate(IP,date))
            {
                return Content("<script>alert('您今天已经投过票了！');</script>", "text/html");
            }
            try
            {
                BidModel bm = new BidModel();
                bm.VoterIP = IP;
                bm.VoteDate = DateTime.Now.Date;
                bm.VoteTime = DateTime.Now;
                bm.VoteContent = Request.Form["VoteCheckbox"];
                br.Insert(bm);
                br.Save();
                return Content("<script>alert('投票成功！');</script>", "text/html");
            }
            catch (Exception e)
            {
                return Content("<script>alert('投票失败，请稍后重试。错误信息：" + e.ToString() + "');</script>", "text/html");
            }
        }

        /// <summary>
        /// 提名-单元测试Pass
        /// </summary>
        /// <returns></returns>
        public ActionResult AddName()
        {
            try
            {
                CandidateModel cm = new CandidateModel();
                cm.BidCount = 0;
                cm.Hidden = 1;
                cm.Priority = 0;
                cm.Name = Request.Form["Name"];
                cm.Introduction = Request.Form["Introduction"];
                CandidateRepository cr = new CandidateRepository();
                cr.Insert(cm);
                cr.Save();
                return Content("<script>alert('提名成功，经过审核后您的提名将会出现在左侧投票列表中，感谢您的参与！');</script>", "text/html");
            }
            catch (Exception e) {
                return Content("<script>alert('提交失败，请稍后重试。错误信息："+e.ToString()+"');</script>", "text/html");
            }
            
        }
    }
}
