using System;
using System.Web.Security;

using Ccs.Security.Contracts;
using Ccs.Validation;

namespace Ccs.Services
{
  public class AccountMembershipService : IMembershipService
  {
    readonly MembershipProvider _provider;

    /// <summary>
    /// Initializes a new instance of the <see cref="AccountMembershipService"/> class.
    /// </summary>
    public AccountMembershipService()
      : this(null)
    {
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="AccountMembershipService"/> class.
    /// </summary>
    /// <param name="provider">The provider.</param>
    public AccountMembershipService(MembershipProvider provider)
    {
      _provider = provider ?? Membership.Provider;
    }

    /// <summary>
    /// Gets the length of the min password.
    /// </summary>
    /// <value>The length of the min password.</value>
    public int MinPasswordLength
    {
      get { return _provider.MinRequiredPasswordLength; }
    }

    /// <summary>
    /// Validates the user.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="password">The password.</param>
    /// <returns></returns>
    public bool ValidateUser(string userName, string password)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");
      ValidationUtil.ValidateRequiredStringValue(password, "password");

      return _provider.ValidateUser(userName, password);
    }

    /// <summary>
    /// Creates the user.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="password">The password.</param>
    /// <param name="email">The email.</param>
    /// <returns></returns>
    public MembershipCreateStatus CreateUser(string userName, string password, string email)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");
      ValidationUtil.ValidateRequiredStringValue(password, "password");
      ValidationUtil.ValidateRequiredStringValue(email, "email");

      MembershipCreateStatus status;
      _provider.CreateUser(userName, password, email, null, null, true, null, out status);
      return status;
    }

    /// <summary>
    /// Changes the password.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="oldPassword">The old password.</param>
    /// <param name="newPassword">The new password.</param>
    /// <returns></returns>
    public bool ChangePassword(string userName, string oldPassword, string newPassword)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");
      ValidationUtil.ValidateRequiredStringValue(oldPassword, "oldPassword");
      ValidationUtil.ValidateRequiredStringValue(newPassword, "newPassword");

      // The underlying ChangePassword() will throw an exception rather
      // than return false in certain failure scenarios.
      try
      {
        var currentUser = _provider.GetUser(userName, true /* userIsOnline */);
        return currentUser.ChangePassword(oldPassword, newPassword);
      }
      catch (ArgumentException)
      {
        return false;
      }
      catch (MembershipPasswordException)
      {
        return false;
      }
    }
  }
}