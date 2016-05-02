﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hongtan.Models
{
    public class bidRepository
    {
        private bidDataContext db = new bidDataContext(ConfigurationManager.ConnectionStrings["HongtanConnectionString"].ConnectionString);
        
        public void Insert(BidModel b)
        {
            db.BidModel.InsertOnSubmit(b);
        }

        public bool CheckDuplicate(string IP, DateTime date) 
        {
            var queryCheckResult = from BidModel in db.BidModel
                              where BidModel.VoterIP == IP && BidModel.VoteDate == date
                              select BidModel;
            if (queryCheckResult.Count() == 0)
            {
                return true;
            }
            else 
            {
                return false;
            }
        }

        public void Save() 
        {
            db.SubmitChanges();
        }
    }
}