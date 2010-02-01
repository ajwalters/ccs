using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Ccs.Models
{
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
}