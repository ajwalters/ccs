using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace Ccs.Site.Models
{
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
      return string.Format(CultureInfo.CurrentUICulture,
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
}