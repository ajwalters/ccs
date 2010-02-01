using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Ccs.Models
{
  public class Room :IKeyable
  {
    [Required]
    public Guid Key { get; set; }

    [Required]
    [DisplayName("Room Name")]
    public string Name { get; set; }
  }
}