#region

using NUnit.Framework;

using WatiN.Core;

#endregion

namespace Ccs.Tests.Acceptance
{
  public abstract class BaseAcceptanceTestContext
  {
    protected static readonly IE browser = new IE();
  }

  [TestFixture]
  public class LogOnTests : BaseAcceptanceTestContext
  {
    [Test]
    public void InvalidLogonTest()
    {
      Go.To.Home(browser);
      Do.LogOn(browser, "paquser", "paqpassword");
    }
  }
}