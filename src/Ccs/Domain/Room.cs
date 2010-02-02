using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

using Ccs.Data;

namespace Ccs.Domain
{
  public class Room : IKeyable
  {
    [Required]
    [DisplayName("Room Name")]
    public string Name { get; set; }

    [Required]
    public Guid Key { get; set; }
  }
}