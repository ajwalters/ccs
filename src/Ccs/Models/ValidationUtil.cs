using System;

namespace Ccs.Models
{
  static class ValidationUtil
  {
    const string StringRequiredErrorMessage = "Value cannot be null or empty.";

    /// <summary>
    /// Validates the required string value.
    /// </summary>
    /// <param name="value">The value.</param>
    /// <param name="parameterName">Name of the parameter.</param>
    public static void ValidateRequiredStringValue(string value, string parameterName)
    {
      if (string.IsNullOrEmpty(value))
      {
        throw new ArgumentException(StringRequiredErrorMessage, parameterName);
      }
    }
  }
}