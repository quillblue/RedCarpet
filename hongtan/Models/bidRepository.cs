using System;
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

        public IEnumerable<BidModel> GetUncheckBidsByCandidateId(int candidateId) {
            return db.BidModel.Where(b => b.VoteStatus == 0 && b.VoteContent.Contains(candidateId.ToString()));
        }

        public IEnumerable<BidModel> GetCheatBidsByCandidateId(int candidateId) {
            IEnumerable<BidModel> returnSet= db.BidModel.Where(b => b.VoteStatus > 0);
            if (candidateId != 0) {
                returnSet = returnSet.Where(b => b.VoteContent.Contains(candidateId.ToString()));
            }
            return returnSet;
        }

        public int[] CheatPotentialCalculate(int candidateId, int bidId)
        {
            BidModel bid = db.BidModel.FirstOrDefault(b => b.Id == bidId);
            if (bid != null)
            {
                int[] cheatPotential = new int[]{0,0,0};
                IEnumerable<BidModel> recentBids = db.BidModel.Where(b => b.VoteTime < bid.VoteTime && b.VoteTime > bid.VoteTime.AddHours(-1) && b.VoteContent.Split(',').Contains(candidateId.ToString()));
                foreach (BidModel bm in recentBids) {
                    if (bm.VoterIP.Split('.')[0] == bid.VoterIP.Split('.')[0]) { cheatPotential[1] += 1; }
                    if (bm.VoteContent == bid.VoteContent) { cheatPotential[2] += 1; }               
                }
                cheatPotential[0] = recentBids.Count();
                return cheatPotential;
            }
            else
            {
                return new int[]{0,0,0};
            }
        }

        public void UpdateVoteStatus(int bidId, int voteStatus)
        {
            BidModel bid = db.BidModel.FirstOrDefault(b => b.Id == bidId);
            if (bid != null)
            {
                bid.VoteStatus = voteStatus;
                Save();
            }
        }

        public void UpdateVoteStatusByCandidateId(int candidateId, int targetStatus) {
            IEnumerable<BidModel> voteList = db.BidModel.Where(b => b.VoteContent.Contains(candidateId.ToString()));
            foreach (BidModel bid in voteList) { bid.VoteStatus = targetStatus; }
            Save();
        }

        public void DeleteVoteById(int bidId) {
            BidModel bid = db.BidModel.First(b => b.Id == bidId);
            if (bid != null) {
                db.BidModel.DeleteOnSubmit(bid);
                db.SubmitChanges();
            }
        }

        public void Save() 
        {
            db.SubmitChanges();
        }

        
    }
}