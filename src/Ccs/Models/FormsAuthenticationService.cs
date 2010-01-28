using System.Web.Security;

namespace Ccs.Site.Models
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