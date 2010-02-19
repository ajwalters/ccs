using NUnit.Framework;

namespace Ccs.Tests.Acceptance
{
  [TestFixture]
  public class AgendaTests : BaseAcceptanceTestContext
  {
    [Test]
    public void EmptyAgendaTest()
    {
      Go.To.Agenda(browser);
      Assert.That(browser.Text, Contains.Substring("No agenda has been confirmed yet."));
    }
  }
}