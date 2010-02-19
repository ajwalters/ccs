namespace Ccs.Security.Contracts
{
  public interface IFormsAuthenticationService
  {
    void SignIn(string userName, bool createPersistentCookie);

    void SignOut();
  }
}