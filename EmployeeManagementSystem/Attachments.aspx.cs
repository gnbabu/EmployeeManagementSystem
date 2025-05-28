using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class Attachments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var json = hfAttachmentsJson.Value;
            if (!string.IsNullOrEmpty(json))
            {
                var attachments = new JavaScriptSerializer().Deserialize<List<Attachment>>(json);
                foreach (var item in attachments)
                {
                    // Save item.FileName, item.FileType, item.Notes, item.S3Url to DB
                }
            }

        }
        public class Attachment
        {
            public string FileName { get; set; }
            public string FileType { get; set; }
            public string Notes { get; set; }
            public string S3Url { get; set; }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}