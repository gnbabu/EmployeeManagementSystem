using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using APISamples.Models;

namespace APISamples.Controllers
{
    [RoutePrefix("api/work")]
    public class WorkHistoryController : ApiController
    {
        [HttpGet]
        [Route("history")]
        public IHttpActionResult GetAllWorkHistory()
        {
            List<WorkHistory> history = GetHistory();
            return Ok(history);
        }

        private List<WorkHistory> GetHistory()
        {
            var history = new List<WorkHistory>
        {
              new WorkHistory
            {
                REG_ID = 371304,
                Operation = "Add",
                Current_Employer = "No",
                PRACTICE_NAME = null,
                Worked_From = new DateTime(2001, 7, 1),
                Worked_To = new DateTime(2014, 6, 1),
                Organization_Name = "East Alabama Cardiac and Thoracic Surgery, P.C.",
                ADDRESS1 = null,
                ADDRESS2 = null,
                CITY = null,
                STATE = null,
                ZIP = null,
                COUNTY = null,
                COUNTRY = null,
                CONTACT_PHONE_NUMBER = null,
                CONTACT_PHONE_EXT = null,
                FAX1 = null,
                FAX2 = null,
                CONTACT_NAME = null,
                Contact_Email_Address1 = null,
                Contact_Email_Address2 = null,
                ADDITIONAL_INFO = null,
                REASON_FOR_DEPARTURE = "Resignation",
                MILTARY_RESERVE = "No",
                LAST_MODIFIED_USERNAME = null,
                LAST_MODIFIED_DATE_TIME = new DateTime(2022, 9, 8, 10, 7, 8, 970)
            },
            new WorkHistory
            {
                REG_ID = 371304,
                Operation = "Add",
                Current_Employer = "No",
                PRACTICE_NAME = null,
                Worked_From = new DateTime(2014, 7, 1),
                Worked_To = new DateTime(2016, 9, 1),
                Organization_Name = "Princeton Baptist Medical Center",
                ADDRESS1 = null,
                ADDRESS2 = null,
                CITY = null,
                STATE = null,
                ZIP = null,
                COUNTY = null,
                COUNTRY = null,
                CONTACT_PHONE_NUMBER = null,
                CONTACT_PHONE_EXT = null,
                FAX1 = null,
                FAX2 = null,
                CONTACT_NAME = null,
                Contact_Email_Address1 = null,
                Contact_Email_Address2 = null,
                ADDITIONAL_INFO = null,
                REASON_FOR_DEPARTURE = "Contract Ended",
                MILTARY_RESERVE = "No",
                LAST_MODIFIED_USERNAME = null,
                LAST_MODIFIED_DATE_TIME = new DateTime(2022, 9, 8, 10, 7, 8, 970)
            },
            new WorkHistory
            {
                REG_ID = 371304,
                Operation = "Add",
                Current_Employer = "No",
                PRACTICE_NAME = null,
                Worked_From = new DateTime(2016, 8, 1),
                Worked_To = new DateTime(2017, 7, 1),
                Organization_Name = "Eastern Maine Medical Center",
                ADDRESS1 = null,
                ADDRESS2 = null,
                CITY = null,
                STATE = null,
                ZIP = null,
                COUNTY = null,
                COUNTRY = null,
                CONTACT_PHONE_NUMBER = null,
                CONTACT_PHONE_EXT = null,
                FAX1 = null,
                FAX2 = null,
                CONTACT_NAME = null,
                Contact_Email_Address1 = null,
                Contact_Email_Address2 = null,
                ADDITIONAL_INFO = null,
                REASON_FOR_DEPARTURE = "New position",
                MILTARY_RESERVE = "No",
                LAST_MODIFIED_USERNAME = null,
                LAST_MODIFIED_DATE_TIME = new DateTime(2022, 9, 8, 10, 7, 8, 970)
            },
            new WorkHistory
            {
                REG_ID = 371304,
                Operation = "Add",
                Current_Employer = "No",
                PRACTICE_NAME = null,
                Worked_From = new DateTime(2018, 4, 1),
                Worked_To = new DateTime(2019, 12, 1),
                Organization_Name = "University Heart Surgeons",
                ADDRESS1 = null,
                ADDRESS2 = null,
                CITY = null,
                STATE = null,
                ZIP = null,
                COUNTY = null,
                COUNTRY = null,
                CONTACT_PHONE_NUMBER = null,
                CONTACT_PHONE_EXT = null,
                FAX1 = null,
                FAX2 = null,
                CONTACT_NAME = null,
                Contact_Email_Address1 = null,
                Contact_Email_Address2 = null,
                ADDITIONAL_INFO = null,
                REASON_FOR_DEPARTURE = "new position",
                MILTARY_RESERVE = "No",
                LAST_MODIFIED_USERNAME = null,
                LAST_MODIFIED_DATE_TIME = new DateTime(2022, 9, 8, 10, 7, 8, 970)
            },
            new WorkHistory
            {
                REG_ID = 371304,
                Operation = "Add",
                Current_Employer = "No",
                PRACTICE_NAME = null,
                Worked_From = new DateTime(2019, 4, 1),
                Worked_To = new DateTime(2021, 10, 1),
                Organization_Name = "Owensboro Health Medical Group, Inc.",
                ADDRESS1 = null,
                ADDRESS2 = null,
                CITY = null,
                STATE = null,
                ZIP = null,
                COUNTY = null,
                COUNTRY = null,
                CONTACT_PHONE_NUMBER = null,
                CONTACT_PHONE_EXT = null,
                FAX1 = null,
                FAX2 = null,
                CONTACT_NAME = null,
                Contact_Email_Address1 = null,
                Contact_Email_Address2 = null,
                ADDITIONAL_INFO = null,
                REASON_FOR_DEPARTURE = "new position",
                MILTARY_RESERVE = "No",
                LAST_MODIFIED_USERNAME = null,
                LAST_MODIFIED_DATE_TIME = new DateTime(2022, 9, 8, 10, 7, 8, 970)
            }
        };
            return history;
        }
    }
}
