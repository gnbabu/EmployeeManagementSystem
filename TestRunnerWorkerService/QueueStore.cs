using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestRunnerWorkerService
{
    public class QueueStore
    {
        public static ConcurrentQueue<MyQueueItem> Queue = new();
    }
}
