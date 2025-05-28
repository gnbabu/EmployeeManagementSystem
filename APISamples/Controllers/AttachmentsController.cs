using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace APISamples.Controllers
{
    [RoutePrefix("api/attachments")]
    public class AttachmentsController : ApiController
    {
        [HttpGet]
        [Route("all")]
        public IHttpActionResult GetAttachments()
        {
            return Ok();
        }

        [HttpGet]
        [Route("filetypes")]
        public IHttpActionResult GetFileTypes()
        {
            var types = new[]
            {
            new { Text = "-- Select File Type --", Value = "" },
            new { Text = "X-Rays", Value = "1" },
            new { Text = "Other Prior Authorization Supporting Documents", Value = "2" },
            new { Text = "Medical Documentation", Value = "3" },
            new { Text = "Pricing Information", Value = "4" }
        };

            return Ok(types);
        }
    }
}
