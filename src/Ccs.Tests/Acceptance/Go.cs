#region

using WatiN.Core;

#endregion

namespace Ccs.Tests.Acceptance
{
  public static class Go
  {
    public static class To
    {
      public static void Home(IE b)
      {
        b.GoTo("http://localhost/ccs");
      }

      public static void Session(IE b)
      {
        b.GoTo("http://localhost/ccs/Session");
      }

      public static void Agenda(IE b)
      {
        b.GoTo("http://localhost/ccs/Agenda");
      }

      public static void Speaker(IE b)
      {
        b.GoTo("http://localhost/ccs/Speaker");
      }
    }
  }
}