using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace hongtan.Models
{
    public class ManageEditApplyDisplayModel
    {
        public EditApplyModel eam;
        public CandidateModel cm;
        public ManageEditApplyDisplayModel(EditApplyModel eam) {
            CandidateRepository cr = new CandidateRepository();
            this.eam = eam;
            this.cm = cr.GetInfoById(eam.RelatedCandidateId);
        }
    }
}