using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Text;
using System.Threading.Tasks;

namespace TestRunnerWorkerService
{
    public class QueueProcessorService : BackgroundService
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogger<QueueProcessorService> _logger;

        public QueueProcessorService(IHttpClientFactory httpClientFactory, ILogger<QueueProcessorService> logger)
        {
            _httpClientFactory = httpClientFactory;
            _logger = logger;
        }
        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            _logger.LogInformation("Queue Processor Service is running.");

            while (!stoppingToken.IsCancellationRequested)
            {
                if (QueueStore.Queue.TryDequeue(out var item))
                {
                    try
                    {
                        var client = _httpClientFactory.CreateClient();
                        var response = await client.PostAsJsonAsync("https://your-api-endpoint.com/api/process", item, stoppingToken);
                        response.EnsureSuccessStatusCode();
                        _logger.LogInformation("Item {Id} sent successfully.", item.Id);
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, "Failed to send item {Id}", item.Id);
                    }
                }

                await Task.Delay(2000, stoppingToken); // 2 seconds delay
            }
        }
    }

}
