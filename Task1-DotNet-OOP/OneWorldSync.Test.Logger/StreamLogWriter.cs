using System;
using System.IO;

namespace OneWorldSync.Test.Logger
{
    /// <summary>
    /// Represents a logger to a stream.
    /// </summary>
    public class StreamLogWritter : LogWriter
    {
        protected TextWriter writer;

        protected StreamLogWritter(TextWriter logWriter)
        {
            writer = logWriter;
        }

        public override void Log(string message, string messageType)
        {
            writer.WriteLine(DateTime.Now.ToString("u") + '\t' + messageType + '\t' + message);
        }
    }
}
