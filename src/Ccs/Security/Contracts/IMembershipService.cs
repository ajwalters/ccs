using System.Web.Security;

namespace Ccs.Security.Contracts
{
  public interface IMembershipService
  {
    /// <summary>
    /// Gets the length of the min password.
    /// </summary>
    /// <value>The length of the min password.</value>
    int MinPasswordLength { get; }

    /// <summary>
    /// Validates the user.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="password">The password.</param>
    /// <returns></returns>
    bool ValidateUser(string userName, string password);

    /// <summary>
    /// Creates the user.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="password">The password.</param>
    /// <param name="email">The email.</param>
    /// <returns></returns>
    MembershipCreateStatus CreateUser(string userName, string password, string email);

    /// <summary>
    /// Changes the password.
    /// </summary>
    /// <param name="userName">Name of the user.</param>
    /// <param name="oldPassword">The old password.</param>
    /// <param name="newPassword">The new password.</param>
    /// <returns></returns>
    bool ChangePassword(string userName, string oldPassword, string newPassword);
  }
}