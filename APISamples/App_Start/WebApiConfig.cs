using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;
using Newtonsoft.Json.Serialization;

namespace APISamples
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //Swagger url
            //http://localhost:53393/swagger/ui/index#/


            // Web API configuration and services

            // Enable CORS for all origins, headers, and methods
            var cors = new EnableCorsAttribute("*", "*", "*");
            config.EnableCors(cors);

            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();


            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
