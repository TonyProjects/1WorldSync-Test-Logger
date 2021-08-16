namespace OneWorldSync.Test.Logger
{
    /// <summary>
    /// Base logger behavior
    /// </summary>
    public interface ILogWriter
    {
        void LogInfo(string message);
        void LogWarning(string message);
        void LogError(string message);
    }

    /// <summary>
    /// Implements base logger behavior. This class is abstract.
    /// </summary>
    public abstract class LogWriter : ILogWriter
    {
        public abstract void Log(string message, string messageType);

        public void LogInfo(string message) => Log(message, "Info");

        public void LogWarning(string message) => Log(message, "Warning");

        public void LogError(string message) => Log(message, "Error");
    }
}
