using TestRunnerWorkerService;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;


Host.CreateDefaultBuilder(args)
    //.UseWindowsService()
    .ConfigureServices((hostContext, services) =>
    {
        services.AddHttpClient();
        services.AddHostedService<QueueProcessorService>();
    })
    .Build()
    .Run();