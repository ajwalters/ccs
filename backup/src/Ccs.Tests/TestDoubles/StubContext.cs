using System.Web;

namespace Ccs.Tests
{
  class StubContext : HttpContextBase
  {
    readonly StubRequest request;

    public StubContext(string relativeUrl)
    {
      request = new StubRequest(relativeUrl);
    }

    public override HttpRequestBase Request
    {
      get { return request; }
    }
  }
}