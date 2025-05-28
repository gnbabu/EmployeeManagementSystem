using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using APISamples.Models;

namespace APISamples.Controllers
{
    [RoutePrefix("api/employees")]
    public class EmployeesController : ApiController
    {
        [HttpGet]
        [Route("all")]
        public IHttpActionResult GetAllEmployees()
        {
            List<Employee> employees = GetEmployees().OrderBy(emp => emp.Name).ToList();
            return Ok(employees);
        }


        private List<Employee> GetEmployees() => new List<Employee>
{
            new Employee
        {
            Name = "Calvin Lowe",
            Age = 55,
            Email = "calvin.lowe1@company.com",
            Salary = 62111,
            Department = "HR",
            City = "Berlin",
            Country = "Japan",
            Position = "Manager",
            Experience = 20,
            JoiningDate = DateTime.Parse("2023-12-07")
        },
            new Employee
        {
            Name = "Julie Hurley",
            Age = 53,
            Email = "julie.hurley2@company.com",
            Salary = 57532,
            Department = "Finance",
            City = "New York",
            Country = "UK",
            Position = "Developer",
            Experience = 13,
            JoiningDate = DateTime.Parse("2020-03-06")
        },
            new Employee
        {
            Name = "Daniel Lopez",
            Age = 26,
            Email = "daniel.lopez3@company.com",
            Salary = 107394,
            Department = "Finance",
            City = "Berlin",
            Country = "Japan",
            Position = "Analyst",
            Experience = 14,
            JoiningDate = DateTime.Parse("2022-02-17")
        },
            new Employee
        {
            Name = "Becky Hernandez",
            Age = 43,
            Email = "becky.hernandez4@company.com",
            Salary = 107518,
            Department = "Finance",
            City = "New York",
            Country = "Germany",
            Position = "Developer",
            Experience = 3,
            JoiningDate = DateTime.Parse("2016-06-22")
        },
            new Employee
        {
            Name = "Stacey Walters",
            Age = 43,
            Email = "stacey.walters5@company.com",
            Salary = 115560,
            Department = "Finance",
            City = "Tokyo",
            Country = "USA",
            Position = "Manager",
            Experience = 3,
            JoiningDate = DateTime.Parse("2024-11-01")
        },
            new Employee
        {
            Name = "Daniel Phillips",
            Age = 57,
            Email = "daniel.phillips6@company.com",
            Salary = 117776,
            Department = "Finance",
            City = "New York",
            Country = "Germany",
            Position = "Manager",
            Experience = 5,
            JoiningDate = DateTime.Parse("2020-05-07")
        },
            new Employee
        {
            Name = "Nicholas Ramsey",
            Age = 28,
            Email = "nicholas.ramsey7@company.com",
            Salary = 118989,
            Department = "IT",
            City = "Tokyo",
            Country = "Germany",
            Position = "Designer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2020-06-03")
        },
            new Employee
        {
            Name = "Hannah George",
            Age = 45,
            Email = "hannah.george8@company.com",
            Salary = 107415,
            Department = "IT",
            City = "London",
            Country = "India",
            Position = "Designer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2017-08-17")
        },
            new Employee
        {
            Name = "Bethany Wells",
            Age = 43,
            Email = "bethany.wells9@company.com",
            Salary = 69793,
            Department = "HR",
            City = "Tokyo",
            Country = "Germany",
            Position = "Manager",
            Experience = 10,
            JoiningDate = DateTime.Parse("2022-12-16")
        },
            new Employee
        {
            Name = "Robert Gill",
            Age = 46,
            Email = "robert.gill10@company.com",
            Salary = 108854,
            Department = "Finance",
            City = "New York",
            Country = "India",
            Position = "Manager",
            Experience = 8,
            JoiningDate = DateTime.Parse("2018-05-26")
        },
            new Employee
        {
            Name = "Daniel Young",
            Age = 50,
            Email = "daniel.young11@company.com",
            Salary = 117665,
            Department = "IT",
            City = "Delhi",
            Country = "UK",
            Position = "Manager",
            Experience = 14,
            JoiningDate = DateTime.Parse("2025-03-19")
        },
            new Employee
        {
            Name = "Amy Wu",
            Age = 41,
            Email = "amy.wu12@company.com",
            Salary = 47923,
            Department = "Marketing",
            City = "New York",
            Country = "India",
            Position = "Designer",
            Experience = 4,
            JoiningDate = DateTime.Parse("2021-06-20")
        },
            new Employee
        {
            Name = "Benjamin Charles",
            Age = 54,
            Email = "benjamin.charles13@company.com",
            Salary = 66996,
            Department = "Sales",
            City = "Delhi",
            Country = "USA",
            Position = "Analyst",
            Experience = 12,
            JoiningDate = DateTime.Parse("2023-06-24")
        },
            new Employee
        {
            Name = "Brandon Bauer",
            Age = 42,
            Email = "brandon.bauer14@company.com",
            Salary = 114701,
            Department = "Finance",
            City = "Delhi",
            Country = "India",
            Position = "Manager",
            Experience = 12,
            JoiningDate = DateTime.Parse("2019-05-08")
        },
            new Employee
        {
            Name = "Nathan Lee",
            Age = 53,
            Email = "nathan.lee15@company.com",
            Salary = 72735,
            Department = "Sales",
            City = "Berlin",
            Country = "Germany",
            Position = "Analyst",
            Experience = 8,
            JoiningDate = DateTime.Parse("2024-03-05")
        },
            new Employee
        {
            Name = "Marc Roman",
            Age = 59,
            Email = "marc.roman16@company.com",
            Salary = 54706,
            Department = "IT",
            City = "London",
            Country = "UK",
            Position = "Designer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2022-11-15")
        },
            new Employee
        {
            Name = "Jason Gordon",
            Age = 56,
            Email = "jason.gordon17@company.com",
            Salary = 50335,
            Department = "Finance",
            City = "New York",
            Country = "Germany",
            Position = "Developer",
            Experience = 5,
            JoiningDate = DateTime.Parse("2024-10-17")
        },
            new Employee
        {
            Name = "James Brown",
            Age = 58,
            Email = "james.brown18@company.com",
            Salary = 44361,
            Department = "Sales",
            City = "Delhi",
            Country = "Japan",
            Position = "Manager",
            Experience = 17,
            JoiningDate = DateTime.Parse("2017-07-03")
        },
            new Employee
        {
            Name = "Jacqueline Elliott",
            Age = 47,
            Email = "jacqueline.elliott19@company.com",
            Salary = 43539,
            Department = "Finance",
            City = "London",
            Country = "Japan",
            Position = "Analyst",
            Experience = 20,
            JoiningDate = DateTime.Parse("2019-01-26")
        },
            new Employee
        {
            Name = "Joel Harvey",
            Age = 60,
            Email = "joel.harvey20@company.com",
            Salary = 74978,
            Department = "Sales",
            City = "Berlin",
            Country = "USA",
            Position = "Manager",
            Experience = 7,
            JoiningDate = DateTime.Parse("2023-04-17")
        },
            new Employee
        {
            Name = "Katherine Riddle",
            Age = 56,
            Email = "katherine.riddle21@company.com",
            Salary = 117671,
            Department = "Finance",
            City = "Delhi",
            Country = "Japan",
            Position = "Designer",
            Experience = 18,
            JoiningDate = DateTime.Parse("2015-12-23")
        },
            new Employee
        {
            Name = "Ashley Hicks",
            Age = 23,
            Email = "ashley.hicks22@company.com",
            Salary = 77989,
            Department = "Finance",
            City = "London",
            Country = "Japan",
            Position = "Designer",
            Experience = 11,
            JoiningDate = DateTime.Parse("2024-04-26")
        },
            new Employee
        {
            Name = "Cody Gardner",
            Age = 47,
            Email = "cody.gardner23@company.com",
            Salary = 105782,
            Department = "Marketing",
            City = "Delhi",
            Country = "Japan",
            Position = "Developer",
            Experience = 14,
            JoiningDate = DateTime.Parse("2023-06-26")
        },
            new Employee
        {
            Name = "Melissa Park",
            Age = 23,
            Email = "melissa.park24@company.com",
            Salary = 103011,
            Department = "Finance",
            City = "London",
            Country = "Germany",
            Position = "Manager",
            Experience = 9,
            JoiningDate = DateTime.Parse("2025-03-06")
        },
            new Employee
        {
            Name = "Michelle Pittman",
            Age = 26,
            Email = "michelle.pittman25@company.com",
            Salary = 49967,
            Department = "HR",
            City = "London",
            Country = "Japan",
            Position = "Analyst",
            Experience = 19,
            JoiningDate = DateTime.Parse("2023-03-12")
        },
            new Employee
        {
            Name = "Ricky Gray",
            Age = 25,
            Email = "ricky.gray26@company.com",
            Salary = 71341,
            Department = "Marketing",
            City = "London",
            Country = "UK",
            Position = "Manager",
            Experience = 11,
            JoiningDate = DateTime.Parse("2020-08-29")
        },
            new Employee
        {
            Name = "Robin Alvarez",
            Age = 28,
            Email = "robin.alvarez27@company.com",
            Salary = 73672,
            Department = "Finance",
            City = "Tokyo",
            Country = "Germany",
            Position = "Designer",
            Experience = 11,
            JoiningDate = DateTime.Parse("2019-12-23")
        },
            new Employee
        {
            Name = "David Little",
            Age = 37,
            Email = "david.little28@company.com",
            Salary = 57141,
            Department = "Sales",
            City = "Delhi",
            Country = "Japan",
            Position = "Developer",
            Experience = 15,
            JoiningDate = DateTime.Parse("2025-01-20")
        },
            new Employee
        {
            Name = "Elaine Kline",
            Age = 22,
            Email = "elaine.kline29@company.com",
            Salary = 51642,
            Department = "HR",
            City = "New York",
            Country = "Japan",
            Position = "Manager",
            Experience = 3,
            JoiningDate = DateTime.Parse("2023-10-04")
        },
            new Employee
        {
            Name = "Matthew Frey",
            Age = 33,
            Email = "matthew.frey30@company.com",
            Salary = 63301,
            Department = "Sales",
            City = "New York",
            Country = "India",
            Position = "Analyst",
            Experience = 17,
            JoiningDate = DateTime.Parse("2023-10-22")
        },
            new Employee
        {
            Name = "Eric Anderson",
            Age = 57,
            Email = "eric.anderson31@company.com",
            Salary = 71918,
            Department = "Sales",
            City = "London",
            Country = "India",
            Position = "Designer",
            Experience = 3,
            JoiningDate = DateTime.Parse("2019-08-09")
        },
            new Employee
        {
            Name = "Michael Zimmerman",
            Age = 40,
            Email = "michael.zimmerman32@company.com",
            Salary = 69592,
            Department = "Marketing",
            City = "Tokyo",
            Country = "USA",
            Position = "Manager",
            Experience = 3,
            JoiningDate = DateTime.Parse("2021-05-25")
        },
            new Employee
        {
            Name = "Paul Jackson",
            Age = 27,
            Email = "paul.jackson33@company.com",
            Salary = 112527,
            Department = "Finance",
            City = "Tokyo",
            Country = "Japan",
            Position = "Designer",
            Experience = 4,
            JoiningDate = DateTime.Parse("2020-09-14")
        },
            new Employee
        {
            Name = "James Church",
            Age = 36,
            Email = "james.church34@company.com",
            Salary = 95488,
            Department = "Marketing",
            City = "Berlin",
            Country = "India",
            Position = "Developer",
            Experience = 6,
            JoiningDate = DateTime.Parse("2023-09-06")
        },
            new Employee
        {
            Name = "Linda Nguyen",
            Age = 39,
            Email = "linda.nguyen35@company.com",
            Salary = 103424,
            Department = "HR",
            City = "Tokyo",
            Country = "USA",
            Position = "Analyst",
            Experience = 19,
            JoiningDate = DateTime.Parse("2023-07-16")
        },
            new Employee
        {
            Name = "Tyler Owens",
            Age = 33,
            Email = "tyler.owens36@company.com",
            Salary = 119564,
            Department = "HR",
            City = "Berlin",
            Country = "Germany",
            Position = "Manager",
            Experience = 2,
            JoiningDate = DateTime.Parse("2017-06-11")
        },
            new Employee
        {
            Name = "Timothy Miller",
            Age = 33,
            Email = "timothy.miller37@company.com",
            Salary = 71276,
            Department = "Marketing",
            City = "Berlin",
            Country = "Japan",
            Position = "Manager",
            Experience = 20,
            JoiningDate = DateTime.Parse("2020-09-19")
        },
            new Employee
        {
            Name = "Gregory Kemp",
            Age = 59,
            Email = "gregory.kemp38@company.com",
            Salary = 78066,
            Department = "HR",
            City = "London",
            Country = "India",
            Position = "Developer",
            Experience = 17,
            JoiningDate = DateTime.Parse("2017-03-17")
        },
            new Employee
        {
            Name = "Brittney Edwards",
            Age = 25,
            Email = "brittney.edwards39@company.com",
            Salary = 73722,
            Department = "IT",
            City = "Delhi",
            Country = "India",
            Position = "Analyst",
            Experience = 18,
            JoiningDate = DateTime.Parse("2018-11-19")
        },
            new Employee
        {
            Name = "Kelsey Villarreal",
            Age = 44,
            Email = "kelsey.villarreal40@company.com",
            Salary = 74642,
            Department = "HR",
            City = "Tokyo",
            Country = "Japan",
            Position = "Manager",
            Experience = 17,
            JoiningDate = DateTime.Parse("2020-04-07")
        },
            new Employee
        {
            Name = "Alexander Bennett",
            Age = 31,
            Email = "alexander.bennett41@company.com",
            Salary = 70327,
            Department = "IT",
            City = "New York",
            Country = "Germany",
            Position = "Analyst",
            Experience = 6,
            JoiningDate = DateTime.Parse("2019-11-02")
        },
            new Employee
        {
            Name = "Robin Sanchez",
            Age = 54,
            Email = "robin.sanchez42@company.com",
            Salary = 59516,
            Department = "Finance",
            City = "New York",
            Country = "India",
            Position = "Manager",
            Experience = 12,
            JoiningDate = DateTime.Parse("2018-05-02")
        },
            new Employee
        {
            Name = "Ronald Thomas",
            Age = 27,
            Email = "ronald.thomas43@company.com",
            Salary = 57634,
            Department = "IT",
            City = "Berlin",
            Country = "Germany",
            Position = "Designer",
            Experience = 1,
            JoiningDate = DateTime.Parse("2022-09-19")
        },
            new Employee
        {
            Name = "Mariah Escobar",
            Age = 29,
            Email = "mariah.escobar44@company.com",
            Salary = 119312,
            Department = "HR",
            City = "Berlin",
            Country = "UK",
            Position = "Developer",
            Experience = 4,
            JoiningDate = DateTime.Parse("2016-11-18")
        },
            new Employee
        {
            Name = "Julie Melendez",
            Age = 27,
            Email = "julie.melendez45@company.com",
            Salary = 49455,
            Department = "Finance",
            City = "New York",
            Country = "Germany",
            Position = "Designer",
            Experience = 20,
            JoiningDate = DateTime.Parse("2020-01-04")
        },
            new Employee
        {
            Name = "James Pitts",
            Age = 39,
            Email = "james.pitts46@company.com",
            Salary = 72109,
            Department = "Sales",
            City = "Berlin",
            Country = "UK",
            Position = "Designer",
            Experience = 3,
            JoiningDate = DateTime.Parse("2024-08-16")
        },
            new Employee
        {
            Name = "Courtney Carr",
            Age = 26,
            Email = "courtney.carr47@company.com",
            Salary = 117677,
            Department = "Sales",
            City = "Delhi",
            Country = "Japan",
            Position = "Manager",
            Experience = 9,
            JoiningDate = DateTime.Parse("2025-01-09")
        },
            new Employee
        {
            Name = "Megan Becker",
            Age = 60,
            Email = "megan.becker48@company.com",
            Salary = 54748,
            Department = "HR",
            City = "Berlin",
            Country = "Germany",
            Position = "Designer",
            Experience = 5,
            JoiningDate = DateTime.Parse("2023-01-28")
        },
            new Employee
        {
            Name = "Vanessa Willis",
            Age = 33,
            Email = "vanessa.willis49@company.com",
            Salary = 104336,
            Department = "Sales",
            City = "London",
            Country = "Japan",
            Position = "Analyst",
            Experience = 6,
            JoiningDate = DateTime.Parse("2024-06-16")
        },
            new Employee
        {
            Name = "Anthony Gilbert",
            Age = 41,
            Email = "anthony.gilbert50@company.com",
            Salary = 85791,
            Department = "IT",
            City = "Delhi",
            Country = "India",
            Position = "Developer",
            Experience = 11,
            JoiningDate = DateTime.Parse("2021-12-23")
        },
            new Employee
        {
            Name = "Javier Phillips",
            Age = 49,
            Email = "javier.phillips51@company.com",
            Salary = 57866,
            Department = "Marketing",
            City = "New York",
            Country = "Germany",
            Position = "Manager",
            Experience = 13,
            JoiningDate = DateTime.Parse("2018-05-01")
        },
            new Employee
        {
            Name = "Gina Valdez",
            Age = 44,
            Email = "gina.valdez52@company.com",
            Salary = 102631,
            Department = "Marketing",
            City = "Delhi",
            Country = "USA",
            Position = "Manager",
            Experience = 17,
            JoiningDate = DateTime.Parse("2023-03-14")
        },
            new Employee
        {
            Name = "Corey Bowen",
            Age = 35,
            Email = "corey.bowen53@company.com",
            Salary = 81290,
            Department = "IT",
            City = "New York",
            Country = "USA",
            Position = "Manager",
            Experience = 10,
            JoiningDate = DateTime.Parse("2024-09-07")
        },
            new Employee
        {
            Name = "Erica Montgomery",
            Age = 59,
            Email = "erica.montgomery54@company.com",
            Salary = 41288,
            Department = "Sales",
            City = "New York",
            Country = "Germany",
            Position = "Analyst",
            Experience = 15,
            JoiningDate = DateTime.Parse("2016-04-02")
        },
            new Employee
        {
            Name = "Lauren Shah",
            Age = 41,
            Email = "lauren.shah55@company.com",
            Salary = 55181,
            Department = "IT",
            City = "Delhi",
            Country = "Germany",
            Position = "Designer",
            Experience = 13,
            JoiningDate = DateTime.Parse("2020-09-21")
        },
            new Employee
        {
            Name = "Andrew Jacobs",
            Age = 45,
            Email = "andrew.jacobs56@company.com",
            Salary = 69856,
            Department = "IT",
            City = "Berlin",
            Country = "Japan",
            Position = "Manager",
            Experience = 12,
            JoiningDate = DateTime.Parse("2024-02-28")
        },
            new Employee
        {
            Name = "Christian Harris",
            Age = 59,
            Email = "christian.harris57@company.com",
            Salary = 92560,
            Department = "Marketing",
            City = "Tokyo",
            Country = "USA",
            Position = "Developer",
            Experience = 9,
            JoiningDate = DateTime.Parse("2017-03-05")
        },
            new Employee
        {
            Name = "Karen Burnett",
            Age = 47,
            Email = "karen.burnett58@company.com",
            Salary = 46827,
            Department = "HR",
            City = "New York",
            Country = "India",
            Position = "Designer",
            Experience = 1,
            JoiningDate = DateTime.Parse("2021-12-09")
        },
            new Employee
        {
            Name = "Margaret Wells",
            Age = 47,
            Email = "margaret.wells59@company.com",
            Salary = 94414,
            Department = "IT",
            City = "Tokyo",
            Country = "Germany",
            Position = "Designer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2024-05-24")
        },
            new Employee
        {
            Name = "Danielle Holland",
            Age = 58,
            Email = "danielle.holland60@company.com",
            Salary = 40230,
            Department = "IT",
            City = "London",
            Country = "UK",
            Position = "Designer",
            Experience = 5,
            JoiningDate = DateTime.Parse("2017-12-13")
        },
            new Employee
        {
            Name = "Kristen White",
            Age = 47,
            Email = "kristen.white61@company.com",
            Salary = 58986,
            Department = "HR",
            City = "Tokyo",
            Country = "Germany",
            Position = "Manager",
            Experience = 8,
            JoiningDate = DateTime.Parse("2021-06-29")
        },
            new Employee
        {
            Name = "Kathleen Blankenship",
            Age = 52,
            Email = "kathleen.blankenship62@company.com",
            Salary = 113309,
            Department = "Finance",
            City = "Delhi",
            Country = "Japan",
            Position = "Developer",
            Experience = 15,
            JoiningDate = DateTime.Parse("2020-09-01")
        },
            new Employee
        {
            Name = "Christopher Lara",
            Age = 42,
            Email = "christopher.lara63@company.com",
            Salary = 69102,
            Department = "Finance",
            City = "Delhi",
            Country = "UK",
            Position = "Manager",
            Experience = 15,
            JoiningDate = DateTime.Parse("2020-04-22")
        },
            new Employee
        {
            Name = "Melanie Ford",
            Age = 47,
            Email = "melanie.ford64@company.com",
            Salary = 103663,
            Department = "Sales",
            City = "Delhi",
            Country = "Germany",
            Position = "Manager",
            Experience = 8,
            JoiningDate = DateTime.Parse("2021-11-10")
        },
            new Employee
        {
            Name = "Kelsey Washington",
            Age = 56,
            Email = "kelsey.washington65@company.com",
            Salary = 76876,
            Department = "Finance",
            City = "Delhi",
            Country = "India",
            Position = "Manager",
            Experience = 6,
            JoiningDate = DateTime.Parse("2023-04-20")
        },
            new Employee
        {
            Name = "Joel Alvarado",
            Age = 33,
            Email = "joel.alvarado66@company.com",
            Salary = 70646,
            Department = "Marketing",
            City = "London",
            Country = "India",
            Position = "Analyst",
            Experience = 20,
            JoiningDate = DateTime.Parse("2022-03-25")
        },
            new Employee
        {
            Name = "Eric Lewis",
            Age = 53,
            Email = "eric.lewis67@company.com",
            Salary = 110411,
            Department = "Finance",
            City = "London",
            Country = "Germany",
            Position = "Designer",
            Experience = 9,
            JoiningDate = DateTime.Parse("2024-08-10")
        },
            new Employee
        {
            Name = "Melissa Barrett",
            Age = 50,
            Email = "melissa.barrett68@company.com",
            Salary = 53090,
            Department = "Finance",
            City = "Delhi",
            Country = "USA",
            Position = "Developer",
            Experience = 2,
            JoiningDate = DateTime.Parse("2024-08-28")
        },
            new Employee
        {
            Name = "Megan Martinez",
            Age = 37,
            Email = "megan.martinez69@company.com",
            Salary = 51253,
            Department = "IT",
            City = "London",
            Country = "UK",
            Position = "Designer",
            Experience = 7,
            JoiningDate = DateTime.Parse("2016-12-26")
        },
            new Employee
        {
            Name = "Joshua Hampton",
            Age = 53,
            Email = "joshua.hampton70@company.com",
            Salary = 59643,
            Department = "Sales",
            City = "Tokyo",
            Country = "India",
            Position = "Developer",
            Experience = 2,
            JoiningDate = DateTime.Parse("2018-06-08")
        },
            new Employee
        {
            Name = "John Smith",
            Age = 44,
            Email = "john.smith71@company.com",
            Salary = 108274,
            Department = "Finance",
            City = "New York",
            Country = "UK",
            Position = "Manager",
            Experience = 9,
            JoiningDate = DateTime.Parse("2017-04-20")
        },
            new Employee
        {
            Name = "Alexandra White",
            Age = 23,
            Email = "alexandra.white72@company.com",
            Salary = 85164,
            Department = "HR",
            City = "London",
            Country = "Germany",
            Position = "Analyst",
            Experience = 2,
            JoiningDate = DateTime.Parse("2021-12-25")
        },
            new Employee
        {
            Name = "Brandon Knox",
            Age = 45,
            Email = "brandon.knox73@company.com",
            Salary = 49587,
            Department = "HR",
            City = "Berlin",
            Country = "Japan",
            Position = "Designer",
            Experience = 14,
            JoiningDate = DateTime.Parse("2022-09-26")
        },
            new Employee
        {
            Name = "Jeff Johnson",
            Age = 31,
            Email = "jeff.johnson74@company.com",
            Salary = 40698,
            Department = "HR",
            City = "New York",
            Country = "India",
            Position = "Designer",
            Experience = 4,
            JoiningDate = DateTime.Parse("2015-06-23")
        },
            new Employee
        {
            Name = "Whitney Roberts",
            Age = 25,
            Email = "whitney.roberts75@company.com",
            Salary = 44828,
            Department = "IT",
            City = "Tokyo",
            Country = "USA",
            Position = "Manager",
            Experience = 7,
            JoiningDate = DateTime.Parse("2023-11-27")
        },
            new Employee
        {
            Name = "Sally Simmons",
            Age = 28,
            Email = "sally.simmons76@company.com",
            Salary = 113437,
            Department = "HR",
            City = "Delhi",
            Country = "USA",
            Position = "Manager",
            Experience = 6,
            JoiningDate = DateTime.Parse("2023-05-12")
        },
            new Employee
        {
            Name = "Brittney Baker",
            Age = 36,
            Email = "brittney.baker77@company.com",
            Salary = 75786,
            Department = "Marketing",
            City = "Delhi",
            Country = "Japan",
            Position = "Developer",
            Experience = 3,
            JoiningDate = DateTime.Parse("2024-05-29")
        },
            new Employee
        {
            Name = "Carrie Walters",
            Age = 51,
            Email = "carrie.walters78@company.com",
            Salary = 47300,
            Department = "Sales",
            City = "Tokyo",
            Country = "Germany",
            Position = "Manager",
            Experience = 8,
            JoiningDate = DateTime.Parse("2021-04-24")
        },
            new Employee
        {
            Name = "Zachary Woods",
            Age = 24,
            Email = "zachary.woods79@company.com",
            Salary = 61654,
            Department = "Sales",
            City = "Berlin",
            Country = "Japan",
            Position = "Developer",
            Experience = 13,
            JoiningDate = DateTime.Parse("2016-10-25")
        },
            new Employee
        {
            Name = "John Bishop",
            Age = 50,
            Email = "john.bishop80@company.com",
            Salary = 57976,
            Department = "IT",
            City = "Tokyo",
            Country = "Japan",
            Position = "Manager",
            Experience = 2,
            JoiningDate = DateTime.Parse("2017-07-17")
        },
            new Employee
        {
            Name = "Renee Newton",
            Age = 42,
            Email = "renee.newton81@company.com",
            Salary = 62297,
            Department = "IT",
            City = "New York",
            Country = "Germany",
            Position = "Developer",
            Experience = 11,
            JoiningDate = DateTime.Parse("2017-01-05")
        },
            new Employee
        {
            Name = "Hunter Davis",
            Age = 50,
            Email = "hunter.davis82@company.com",
            Salary = 51962,
            Department = "Sales",
            City = "London",
            Country = "Germany",
            Position = "Developer",
            Experience = 6,
            JoiningDate = DateTime.Parse("2018-08-11")
        },
            new Employee
        {
            Name = "Anthony Reed",
            Age = 60,
            Email = "anthony.reed83@company.com",
            Salary = 56115,
            Department = "Finance",
            City = "London",
            Country = "UK",
            Position = "Developer",
            Experience = 1,
            JoiningDate = DateTime.Parse("2018-01-11")
        },
            new Employee
        {
            Name = "Michael Wright",
            Age = 32,
            Email = "michael.wright84@company.com",
            Salary = 86860,
            Department = "HR",
            City = "Delhi",
            Country = "India",
            Position = "Developer",
            Experience = 5,
            JoiningDate = DateTime.Parse("2022-08-23")
        },
            new Employee
        {
            Name = "Michelle Cooper",
            Age = 47,
            Email = "michelle.cooper85@company.com",
            Salary = 85049,
            Department = "IT",
            City = "Delhi",
            Country = "USA",
            Position = "Analyst",
            Experience = 8,
            JoiningDate = DateTime.Parse("2021-07-04")
        },
            new Employee
        {
            Name = "Michelle Nguyen",
            Age = 50,
            Email = "michelle.nguyen86@company.com",
            Salary = 106140,
            Department = "IT",
            City = "Tokyo",
            Country = "UK",
            Position = "Manager",
            Experience = 10,
            JoiningDate = DateTime.Parse("2018-07-25")
        },
            new Employee
        {
            Name = "Kyle Arellano",
            Age = 59,
            Email = "kyle.arellano87@company.com",
            Salary = 52187,
            Department = "Marketing",
            City = "Tokyo",
            Country = "Japan",
            Position = "Analyst",
            Experience = 5,
            JoiningDate = DateTime.Parse("2018-06-08")
        },
            new Employee
        {
            Name = "Christina Pierce",
            Age = 55,
            Email = "christina.pierce88@company.com",
            Salary = 110398,
            Department = "Finance",
            City = "London",
            Country = "Germany",
            Position = "Designer",
            Experience = 15,
            JoiningDate = DateTime.Parse("2017-05-07")
        },
            new Employee
        {
            Name = "Hunter Marquez",
            Age = 40,
            Email = "hunter.marquez89@company.com",
            Salary = 80104,
            Department = "HR",
            City = "Tokyo",
            Country = "Japan",
            Position = "Designer",
            Experience = 10,
            JoiningDate = DateTime.Parse("2022-11-04")
        },
            new Employee
        {
            Name = "Christian Salas",
            Age = 41,
            Email = "christian.salas90@company.com",
            Salary = 46372,
            Department = "Sales",
            City = "Tokyo",
            Country = "Japan",
            Position = "Developer",
            Experience = 13,
            JoiningDate = DateTime.Parse("2020-06-09")
        },
            new Employee
        {
            Name = "Kimberly Li",
            Age = 49,
            Email = "kimberly.li91@company.com",
            Salary = 110825,
            Department = "Finance",
            City = "London",
            Country = "USA",
            Position = "Developer",
            Experience = 11,
            JoiningDate = DateTime.Parse("2024-09-03")
        },
            new Employee
        {
            Name = "Travis Macias",
            Age = 39,
            Email = "travis.macias92@company.com",
            Salary = 43270,
            Department = "Sales",
            City = "Tokyo",
            Country = "India",
            Position = "Manager",
            Experience = 16,
            JoiningDate = DateTime.Parse("2024-10-25")
        },
            new Employee
        {
            Name = "Daniel Francis",
            Age = 49,
            Email = "daniel.francis93@company.com",
            Salary = 61695,
            Department = "Finance",
            City = "London",
            Country = "USA",
            Position = "Manager",
            Experience = 5,
            JoiningDate = DateTime.Parse("2024-08-04")
        },
            new Employee
        {
            Name = "Natalie Perez",
            Age = 53,
            Email = "natalie.perez94@company.com",
            Salary = 100377,
            Department = "Finance",
            City = "London",
            Country = "UK",
            Position = "Designer",
            Experience = 19,
            JoiningDate = DateTime.Parse("2024-02-22")
        },
            new Employee
        {
            Name = "William Tran",
            Age = 58,
            Email = "william.tran95@company.com",
            Salary = 64801,
            Department = "Sales",
            City = "Tokyo",
            Country = "Germany",
            Position = "Designer",
            Experience = 16,
            JoiningDate = DateTime.Parse("2022-06-30")
        },
            new Employee
        {
            Name = "Judy Stone",
            Age = 46,
            Email = "judy.stone96@company.com",
            Salary = 82220,
            Department = "Marketing",
            City = "Delhi",
            Country = "Japan",
            Position = "Developer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2024-10-01")
        },
            new Employee
        {
            Name = "Cody Hill",
            Age = 46,
            Email = "cody.hill97@company.com",
            Salary = 66009,
            Department = "IT",
            City = "London",
            Country = "India",
            Position = "Developer",
            Experience = 8,
            JoiningDate = DateTime.Parse("2022-04-09")
        },
            new Employee
        {
            Name = "Kenneth Craig",
            Age = 48,
            Email = "kenneth.craig98@company.com",
            Salary = 60788,
            Department = "Sales",
            City = "New York",
            Country = "Japan",
            Position = "Analyst",
            Experience = 1,
            JoiningDate = DateTime.Parse("2017-02-12")
        },
            new Employee
        {
            Name = "Daniel Valencia",
            Age = 41,
            Email = "daniel.valencia99@company.com",
            Salary = 92413,
            Department = "Sales",
            City = "Tokyo",
            Country = "India",
            Position = "Manager",
            Experience = 18,
            JoiningDate = DateTime.Parse("2019-08-05")
        },
            new Employee
        {
            Name = "Robert Dixon",
            Age = 58,
            Email = "robert.dixon100@company.com",
            Salary = 42334,
            Department = "Marketing",
            City = "Tokyo",
            Country = "Japan",
            Position = "Designer",
            Experience = 14,
            JoiningDate = DateTime.Parse("2024-06-13")
        }
};
    }
}
