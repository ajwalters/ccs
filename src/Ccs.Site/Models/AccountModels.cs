using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;

namespace Ccs.Site.Models
{

  #region Services

  // The FormsAuthentication type is sealed and contains static members, so it is difficult to
  // unit test code that calls its members. The interface and helper class below demonstrate
  // how to create an abstract wrapper around such a type in order to make the AccountController
  // code unit testable.

  public interface IMembershipService
  {
    int MinPasswordLength { get; }

    bool ValidateUser(string userName, string password);

    MembershipCreateStatus CreateUser(string userName, string password, string email);

    bool ChangePassword(string userName, string oldPassword, string newPassword);
  }

  public class AccountMembershipService : IMembershipService
  {
    readonly MembershipProvider _provider;

    public AccountMembershipService()
      : this(null)
    {
    }

    public AccountMembershipService(MembershipProvider provider)
    {
      _provider = provider ?? Membership.Provider;
    }

    public int MinPasswordLength
    {
      get { return _provider.MinRequiredPasswordLength; }
    }

    public bool ValidateUser(string userName, string password)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");
      ValidationUtil.ValidateRequiredStringValue(password, "password");

      return _provider.ValidateUser(userName, password);
    }

    public MembershipCreateStatus CreateUser(string userName, string password, string email)
    {
      ValidationUtil.ValidateRequiredStringValue(userName, "userName");
      ValidationUtil.ValidateRequiredStringValue(password, "password");
      ValidationUtil.ValidateRequiredStringValue(email, "email");

      MembershipCreateStatus status;
      _provider.CreateUser(userName, password, email, null, null, true, null, out status);
      return status;
    }

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

  public interface IFormsAuthenticationService
  {
    void SignIn(string userName, bool createPersistentCookie);

    void SignOut();
  }

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

  static class ValidationUtil
  {
    const string _stringRequiredErrorMessage = "Value cannot be null or empty.";

    public static void ValidateRequiredStringValue(string value, string parameterName)
    {
      if (String.IsNullOrEmpty(value))
      {
        throw new ArgumentException(_stringRequiredErrorMessage, parameterName);
      }
    }
  }

  #endregion

  #region Models

  [PropertiesMustMatch("NewPassword", "ConfirmPassword",
    ErrorMessage = "The new password and confirmation password do not match.")]
  public class ChangePasswordModel
  {
    [Required]
    [DataType(DataType.Password)]
    [DisplayName("Current password")]
    public string OldPassword { get; set; }

    [Required]
    [ValidatePasswordLength]
    [DataType(DataType.Password)]
    [DisplayName("New password")]
    public string NewPassword { get; set; }

    [Required]
    [DataType(DataType.Password)]
    [DisplayName("Confirm new password")]
    public string ConfirmPassword { get; set; }
  }

  public class LogOnModel
  {
    [Required]
    [DisplayName("User name")]
    public string UserName { get; set; }

    [Required]
    [DataType(DataType.Password)]
    [DisplayName("Password")]
    public string Password { get; set; }

    [DisplayName("Remember me?")]
    public bool RememberMe { get; set; }
  }

  [PropertiesMustMatch("Password", "ConfirmPassword",
    ErrorMessage = "The password and confirmation password do not match.")]
  public class RegisterModel
  {
    [Required]
    [DisplayName("User name")]
    public string UserName { get; set; }

    [Required]
    [DataType(DataType.EmailAddress)]
    [DisplayName("Email address")]
    public string Email { get; set; }

    [Required]
    [ValidatePasswordLength]
    [DataType(DataType.Password)]
    [DisplayName("Password")]
    public string Password { get; set; }

    [Required]
    [DataType(DataType.Password)]
    [DisplayName("Confirm password")]
    public string ConfirmPassword { get; set; }
  }

  #endregion

  #region Validation

  [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
  public sealed class PropertiesMustMatchAttribute : ValidationAttribute
  {
    const string _defaultErrorMessage = "'{0}' and '{1}' do not match.";

    readonly object _typeId = new object();

    public PropertiesMustMatchAttribute(string originalProperty, string confirmProperty)
      : base(_defaultErrorMessage)
    {
      OriginalProperty = originalProperty;
      ConfirmProperty = confirmProperty;
    }

    public string ConfirmProperty { get; private set; }

    public string OriginalProperty { get; private set; }

    public override object TypeId
    {
      get { return _typeId; }
    }

    public override string FormatErrorMessage(string name)
    {
      return String.Format(CultureInfo.CurrentUICulture,
                           ErrorMessageString,
                           OriginalProperty,
                           ConfirmProperty);
    }

    public override bool IsValid(object value)
    {
      var properties = TypeDescriptor.GetProperties(value);
      var originalValue = properties.Find(OriginalProperty, true /* ignoreCase */).GetValue(value);
      var confirmValue = properties.Find(ConfirmProperty, true /* ignoreCase */).GetValue(value);
      return Equals(originalValue, confirmValue);
    }
  }

  [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false, Inherited = true)]
  public sealed class ValidatePasswordLengthAttribute : ValidationAttribute
  {
    const string _defaultErrorMessage = "'{0}' must be at least {1} characters long.";

    readonly int _minCharacters = Membership.Provider.MinRequiredPasswordLength;

    public ValidatePasswordLengthAttribute()
      : base(_defaultErrorMessage)
    {
    }

    public override string FormatErrorMessage(string name)
    {
      return String.Format(CultureInfo.CurrentUICulture,
                           ErrorMessageString,
                           name,
                           _minCharacters);
    }

    public override bool IsValid(object value)
    {
      var valueAsString = value as string;
      return (valueAsString != null && valueAsString.Length >= _minCharacters);
    }
  }

  #endregion
}