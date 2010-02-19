#region

using System;

using NUnit.Framework;

#endregion

namespace Ccs.Tests.Acceptance
{
  [TestFixture]
  public class SessionTests : BaseAcceptanceTestContext
  {
    [Test]
    public void AddNewSessionTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void DeleteSessionTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void EmptySessionListTest()
    {
      Go.To.Session(browser);
      Assert.That(browser.Text, Contains.Substring("No sessions have been registered yet."));
    }

    [Test]
    public void GetSessionByUrlTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void UpdateSessionTest()
    {
      throw new NotImplementedException();
    }
  }
}