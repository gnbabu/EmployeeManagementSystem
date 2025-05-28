using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace APISamples.Models
{
    public class Employee
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public string Email { get; set; }
        public decimal Salary { get; set; }
        public string Department { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Position { get; set; }
        public int Experience { get; set; }
        public DateTime JoiningDate { get; set; }
    }
}