using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace hongtan.Models
{
    public class bidRepository
    {
        private bidDataContext db = new bidDataContext(ConfigurationManager.ConnectionStrings["LocalTestConnectionString"].ConnectionString);
        
        public void Insert(BidModel b)
        {
            db.hongtan_Vote.InsertOnSubmit(b);
        }

        public bool CheckDuplicate(string IP, DateTime date) 
        {
            var queryCheckResult = from BidModel in db.hongtan_Vote
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