#region

using System;

using NUnit.Framework;

#endregion

namespace Ccs.Tests.Acceptance
{
  [TestFixture]
  public class SpeakerTests : BaseAcceptanceTestContext
  {
    [Test]
    public void AddNewSpeakerTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void DeleteSpeakerTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void EmptySpeakerListTest()
    {
      Go.To.Speaker(browser);
      Assert.That(browser.Text, Contains.Substring("No speakers have been registered yet."));
    }

    [Test]
    public void GetSpeakerByUrlTest()
    {
      throw new NotImplementedException();
    }

    [Test]
    public void UpdateSpeakerTest()
    {
      throw new NotImplementedException();
    }
  }
}