using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using APISamples.Models;

namespace APISamples.Controllers
{
    [RoutePrefix("api/correspondence")]
    public class CorrespondenceController : ApiController
    {
        private static readonly List<CorrespondenceSearchResult> MockData =
     new List<CorrespondenceSearchResult>
 {
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 1,
        Subject = "Provider Credentialing – Initial Request",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 01, 01),
        DateAvailableTo = new DateTime(2024, 01, 05)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 2,
        Subject = "Provider Credentialing – Second Request",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 01, 10),
        DateAvailableTo = new DateTime(2024, 01, 15)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 3,
        Subject = "Provider Credentialing – Final Request",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 02, 01),
        DateAvailableTo = new DateTime(2024, 02, 05)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 4,
        Subject = "Revalidation Notice",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 02, 10),
        DateAvailableTo = new DateTime(2024, 02, 15)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 5,
        Subject = "Missing Documentation Notification",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 02, 20),
        DateAvailableTo = new DateTime(2024, 02, 25)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 6,
        Subject = "Enrollment Status Update",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 03, 01),
        DateAvailableTo = new DateTime(2024, 03, 05)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 7,
        Subject = "Application Returned – Action Required",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 03, 10),
        DateAvailableTo = new DateTime(2024, 03, 15)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 8,
        Subject = "DEA Information Required",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 03, 20),
        DateAvailableTo = new DateTime(2024, 03, 25)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 9,
        Subject = "CAQH Attestation Pending",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 04, 01),
        DateAvailableTo = new DateTime(2024, 04, 05)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 10,
        Subject = "Work History Clarification Required",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 04, 10),
        DateAvailableTo = new DateTime(2024, 04, 15)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 11,
        Subject = "Enrollment Approval Notification",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 04, 20),
        DateAvailableTo = new DateTime(2024, 04, 25)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 12,
        Subject = "Revalidation Reminder",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 05, 01),
        DateAvailableTo = new DateTime(2024, 05, 05)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 13,
        Subject = "Credentialing Review in Progress",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 05, 10),
        DateAvailableTo = new DateTime(2024, 05, 15)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 14,
        Subject = "Additional Information Requested",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 05, 20),
        DateAvailableTo = new DateTime(2024, 05, 25)
    },
    new CorrespondenceSearchResult
    {
        CorrespondenceId = 15,
        Subject = "Provider Credentialing – Final Determination",
        MedicaidId = "987654321",
        RegId = "REG002",
        ProviderId = "PROV002",
        Npi = "1184662099",
        DateAvailableFrom = new DateTime(2024, 06, 01),
        DateAvailableTo = new DateTime(2024, 06, 05)
    }
 };


        [HttpPost]
        [Route("search")]
        public IHttpActionResult Search([FromBody] CorrespondenceSearchRequest request)
        {
            // 🔒 Mandatory validation
            if (string.IsNullOrWhiteSpace(request.RegId) ||
                string.IsNullOrWhiteSpace(request.ProviderId) ||
                string.IsNullOrWhiteSpace(request.Npi))
            {
                return BadRequest("Reg ID, Provider ID, and NPI are mandatory.");
            }

            // 📅 Date validation
            if ((request.DateFrom.HasValue && !request.DateTo.HasValue) ||
                (!request.DateFrom.HasValue && request.DateTo.HasValue))
            {
                return BadRequest("Both Date From and Date To must be provided.");
            }

            if (request.DateFrom.HasValue && request.DateTo.HasValue &&
                request.DateFrom > request.DateTo)
            {
                return BadRequest("Date From cannot be greater than Date To.");
            }

            // 🔍 Filtering mock data
            var query = MockData
                .Where(x =>
                    x.RegId.Equals(request.RegId, StringComparison.OrdinalIgnoreCase) &&
                    x.ProviderId.Equals(request.ProviderId, StringComparison.OrdinalIgnoreCase) &&
                    x.Npi.Equals(request.Npi, StringComparison.OrdinalIgnoreCase)
                );

            if (request.DateFrom.HasValue && request.DateTo.HasValue)
            {
                query = query.Where(x =>
                    x.DateAvailableFrom >= request.DateFrom.Value &&
                    x.DateAvailableTo <= request.DateTo.Value
                );
            }

            var result = query
                .OrderByDescending(x => x.DateAvailableFrom)
                .ToList();

            // return Ok(result);
            return Ok(MockData);
        }
    }
}
