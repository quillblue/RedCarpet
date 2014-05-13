﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hongtan.Models
{
    public class CandidateRepository
    {
        private CandidateModelDataContext db = new CandidateModelDataContext();

        public void Insert(CandidateModel c)
        {
            db.CandidateModel.InsertOnSubmit(c);
        }

        public void BeVoted(int id) 
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            candidate.BidCount += 1;
            db.SubmitChanges();
        }

        public List<CandidateModel> GetAllHidden() 
        {
            List<CandidateModel> cl=new List<CandidateModel>();
            IEnumerable<CandidateModel> queryCandidateList = from CandidateModel in db.CandidateModel
                                                             where CandidateModel.Hidden==1
                                                             orderby CandidateModel.BidCount
                                                             select CandidateModel;
            foreach (CandidateModel c in queryCandidateList) {
                cl.Add(c);
            }
            return cl;
        }

        public List<CandidateModel> GetAllShown()
        {
            List<CandidateModel> cl = new List<CandidateModel>();
            IEnumerable<CandidateModel> queryCandidateList = from CandidateModel in db.CandidateModel
                                                             where CandidateModel.Hidden == 0
                                                             orderby CandidateModel.BidCount
                                                             select CandidateModel;
            foreach (CandidateModel c in queryCandidateList)
            {
                cl.Add(c);
            }
            return cl;
        }

        public void SwitchDisplay(int id) 
        {
            CandidateModel candidate = db.CandidateModel.First(c => c.Id == id);
            if (candidate.Hidden == 1)
            {
                candidate.Hidden = 0;
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

        public void Save() 
        {
            db.SubmitChanges();
        }
    }
}