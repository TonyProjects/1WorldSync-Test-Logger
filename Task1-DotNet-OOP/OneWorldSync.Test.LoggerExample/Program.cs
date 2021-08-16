using System.Collections.Generic;
using OneWorldSync.Test.Logger;

namespace OneWorldSync.Test.LoggerExample
{
    class Program
    {
        static void Main(string[] args)
        {
            var cnslWriter = new ConsoleLogWriter();
            var FileWriter = new FileLogWriter("log.txt");

            var multWriter = new MultipleLogWriter(new List<LogWriter> 
            { 
                cnslWriter, 
                FileWriter 
            });
            
            multWriter.LogInfo("Just a regular message");
            multWriter.LogWarning("It's kinda hot in here");
            multWriter.LogError("Done..");
        }
    }
}
