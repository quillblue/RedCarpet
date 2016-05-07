using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hongtan.Models
{
    public class CandidateRepository
    {
        private CandidateModelDataContext db = new CandidateModelDataContext(ConfigurationManager.ConnectionStrings["HongtanConnectionString"].ConnectionString);

        public void Insert(CandidateModel c)
        {
            db.CandidateModel.InsertOnSubmit(c);
        }

        public void ApplyEdit(EditApplyModel eam)
        {
            db.EditApplyModel.InsertOnSubmit(eam);
            db.SubmitChanges();
        }

        public void BeVoted(int id)
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            candidate.BidCount += 1;
            db.SubmitChanges();
        }

        public void BeAdjusted(int id, int adjustAmount) {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            candidate.BidCount += adjustAmount;
            candidate.BidAdjust += adjustAmount;
            db.SubmitChanges();
        }

        public void RelatedVoteIsWithdrawed(int id) {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            candidate.BidCount -= 1;
            if (candidate.BidAdjust < 0) {
                candidate.BidAdjust += 1;
            }
            db.SubmitChanges();
        }

        public List<CandidateModel> GetAllHidden()
        {
            List<CandidateModel> cl = new List<CandidateModel>();
            IEnumerable<CandidateModel> queryCandidateList = from CandidateModel in db.CandidateModel
                                                             where CandidateModel.Hidden == 1
                                                             orderby CandidateModel.BidCount
                                                             select CandidateModel;
            foreach (CandidateModel c in queryCandidateList)
            {
                cl.Add(c);
            }
            return cl;
        }

        public List<CandidateModel> GetAllShown()
        {
            List<CandidateModel> cl = new List<CandidateModel>();
            IEnumerable<CandidateModel> queryCandidateList = from CandidateModel in db.CandidateModel
                                                             where CandidateModel.Hidden == 0
                                                             orderby CandidateModel.Priority descending
                                                             select CandidateModel;
            foreach (CandidateModel c in queryCandidateList)
            {
                cl.Add(c);
            }
            return cl;
        }

        /// <summary>
        /// Check duplicate candidate in db
        /// </summary>
        /// <param name="target"></param>
        /// <returns>-2:Serious Duplicate, -1: No duplicate, >0:potential duplicate with duplicate id</returns>
        public int CheckDuplicate(CandidateModel target) {
            List<CandidateModel> cl = db.CandidateModel.Where(c => c.Name == target.Name).ToList<CandidateModel>();
            if (cl.Count > 0) {
                foreach (CandidateModel cm in cl) {
                    if (cm.Department == target.Department && cm.Role == target.Role) { return -2; }
                }
                return cl.First().Id; 
            }
            else { return -1; }
        }

        public List<EditApplyModel> GetAllEditApply() {
            return db.EditApplyModel.ToList();
        }

        public void SwitchDisplay(int id)
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            if (candidate.Hidden == 1)
            {
                candidate.Hidden = 0;
                candidate.Type = candidate.Type % 10;
            }
            else
            {
                candidate.Hidden = 1;
            }
            db.SubmitChanges();
        }

        public void Delete(int id)
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            db.CandidateModel.DeleteOnSubmit(candidate);
            db.EditApplyModel.DeleteAllOnSubmit(db.EditApplyModel.Where(eam => eam.RelatedCandidateId == id));
        }

        public CandidateModel GetInfoById(int id)
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            return candidate;
        }

        public void Update(CandidateModel cm)
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == cm.Id);
            candidate.Name = cm.Name;
            candidate.Department = cm.Department;
            candidate.Role = cm.Role;
            candidate.Type = cm.Type;
            candidate.Tel = cm.Tel;
            candidate.Introduction = cm.Introduction;
            candidate.Story = cm.Story;
            candidate.Priority = cm.Priority;
            db.SubmitChanges();
        }

        public void RejectEditApply(int id) {
            EditApplyModel eam = db.EditApplyModel.First(e => e.Id == id);
            db.EditApplyModel.DeleteOnSubmit(eam);
            db.SubmitChanges();
        }

        public IEnumerable<int> GetTopCandidates(int count) {
            return db.CandidateModel.OrderBy(c => (c.BidCount - c.BidAdjust)).Take(count).Select(c=>c.Id);
        }
        public IEnumerable<int> GetAllCandidates()
        {
            return db.CandidateModel.OrderBy(c => (c.BidCount - c.BidAdjust)).Select(c => c.Id);
        }

        public void Save()
        {
            db.SubmitChanges();
        }
    }
}