using System.Collections.Generic;

namespace OneWorldSync.Test.Logger
{
    /// <summary>
    /// Represents a logger that can write to multiple streams concurrently.
    /// </summary>
    public sealed class MultipleLogWriter : LogWriter
    {
        List<LogWriter> writers;

        public MultipleLogWriter(List<LogWriter> logWriters)
        {
            writers = logWriters;
        }

        public override void Log(string message, string messageType)
        {
            writers.ForEach(w => w.Log(message, messageType));
        }
    }
}
