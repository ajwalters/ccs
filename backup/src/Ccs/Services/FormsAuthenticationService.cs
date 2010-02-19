using System.Web.Security;

using Ccs.Security.Contracts;
using Ccs.Validation;

namespace Ccs.Services
{
  public class FormsAuthenticationService : IFormsAuthenticationService
  {
    public void SignIn(string userName, bool createPersistentCookie)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");

      FormsAuthentication.SetAuthCookie(userName, createPersistentCookie);
    }

    public void SignOut()
    {
      FormsAuthentication.SignOut();
    }
  }
}