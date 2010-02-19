using WatiN.Core;

namespace Ccs.Tests.Acceptance
{
  public static class Do
  {
    public static void LogOn(IE b, string userName, string password)
    {
      b.Link(e => e.Text == "Log On").Click();
      b.TextField(e => e.IdOrName == "UserName").Value = userName;
      b.TextField(e => e.IdOrName == "Password").Value = password;
      b.Button(e => e.Value == "Log On").Click();
    }
  }
}