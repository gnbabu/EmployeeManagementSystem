using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using APISamples.Models;


namespace APISamples.Controllers
{
    [RoutePrefix("api/customers")]
    public class CustomersController : ApiController
    {
        [HttpGet]
        [Route("all")]
        public IHttpActionResult GetAllCustomers()
        {
            var customers = GetCustomers();
            return Ok(customers);
        }

        private static List<Customer> GetCustomers()
        {
            return new List<Customer>
        {
            new Customer { Id = 1, Name = "Alice", Email = "alice@example.com", Phone = "1234567890", Website = "www.alice.com" },
            new Customer { Id = 2, Name = "Bob", Email = "bob@example.com", Phone = "9876543210", Website = "www.bob.com" },
            new Customer { Id = 3, Name = "Charlie", Email = "charlie@example.com", Phone = "5555555555", Website = "www.charlie.com" },
            new Customer { Id = 4, Name = "Diana", Email = "diana@example.com", Phone = "4444444444", Website = "www.diana.com" },
            new Customer { Id = 5, Name = "Eve", Email = "eve@example.com", Phone = "3333333333", Website = "www.eve.com" }
        };
        }

    }
}
