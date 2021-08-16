using System.IO;

namespace OneWorldSync.Test.Logger
{
    /// <summary>
    /// Represents a logger to a file.
    /// </summary>
    public sealed class FileLogWriter : StreamLogWritter
    {
        public FileLogWriter(string path) : base(new StreamWriter(path, true))
        {
            ((StreamWriter)writer).AutoFlush = true;
        }
    }
}
