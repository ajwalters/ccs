using System;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;

namespace Ccs.Models
{
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
      return string.Format(CultureInfo.CurrentUICulture,
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
}