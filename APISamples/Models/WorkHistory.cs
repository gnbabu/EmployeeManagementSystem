using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APISamples.Models
{
    public class WorkHistory
    {
        public int REG_ID { get; set; }
        public string Operation { get; set; }
        public string Current_Employer { get; set; }
        public string PRACTICE_NAME { get; set; }
        public DateTime? Worked_From { get; set; }
        public DateTime? Worked_To { get; set; }
        public string Organization_Name { get; set; }
        public string ADDRESS1 { get; set; }
        public string ADDRESS2 { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public string ZIP { get; set; }
        public string COUNTY { get; set; }
        public string COUNTRY { get; set; }
        public string CONTACT_PHONE_NUMBER { get; set; }
        public string CONTACT_PHONE_EXT { get; set; }
        public string FAX1 { get; set; }
        public string FAX2 { get; set; }
        public string CONTACT_NAME { get; set; }
        public string Contact_Email_Address1 { get; set; }
        public string Contact_Email_Address2 { get; set; }
        public string ADDITIONAL_INFO { get; set; }
        public string REASON_FOR_DEPARTURE { get; set; }
        public string MILTARY_RESERVE { get; set; }
        public string LAST_MODIFIED_USERNAME { get; set; }
        public DateTime? LAST_MODIFIED_DATE_TIME { get; set; }
    }
}