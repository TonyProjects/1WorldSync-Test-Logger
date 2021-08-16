using System;

namespace OneWorldSync.Test.Logger
{
    /// <summary>
    /// Represents a logger to the Console.
    /// </summary>
    public sealed class ConsoleLogWriter : StreamLogWritter
    {
        public ConsoleLogWriter() : base(Console.Out)
        {}
    }
}
