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

        public int GetDuplicateId(String name) {
            List<CandidateModel> cl = db.CandidateModel.Where(c => c.Name == name).ToList<CandidateModel>();
            if (cl.Count > 0) { return cl.First().Id; }
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
            candidate.Tel = cm.Tel;
            candidate.Introduction = cm.Introduction;
            candidate.Story = cm.Story;
            candidate.Priority = cm.Priority;
            db.SubmitChanges();
        }

        public void AcceptEditApply(int id)
        {
            EditApplyModel eam = db.EditApplyModel.First(e => e.Id == id);
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == eam.RelatedCandidateId);
            candidate.Name = eam.Name;
            candidate.Introduction = eam.Introduction;
            candidate.Story = eam.Story;
            db.EditApplyModel.DeleteOnSubmit(eam);
            db.SubmitChanges();
        }

        public void RejectEditApply(int id) {
            EditApplyModel eam = db.EditApplyModel.First(e => e.Id == id);
            db.EditApplyModel.DeleteOnSubmit(eam);
            db.SubmitChanges();
        }

        public void Save()
        {
            db.SubmitChanges();
        }
    }
}