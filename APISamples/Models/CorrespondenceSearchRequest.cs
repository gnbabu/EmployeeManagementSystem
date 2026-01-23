using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APISamples.Models
{
    public class CorrespondenceSearchRequest
    {
        public string RegId { get; set; }          // Mandatory
        public string ProviderId { get; set; }     // Mandatory
        public string Npi { get; set; }             // Mandatory

        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
    }

    public class CorrespondenceSearchResult
    {
        public int CorrespondenceId { get; set; }
        public string Subject { get; set; }

        public string MedicaidId { get; set; }
        public string RegId { get; set; }
        public string ProviderId { get; set; }
        public string Npi { get; set; }

        public DateTime DateAvailableFrom { get; set; }
        public DateTime DateAvailableTo { get; set; }
    }

}