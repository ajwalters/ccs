using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;

using Ccs.Data;

namespace Ccs.Domain
{
  public class Session : IKeyable
  {
    [Required]
    [DisplayName("Session name")]
    public string Name { get; set; }

    [DisplayName("Session abstract")]
    [Required]
    public string Abstract { get; set; }

    [DisplayName("Session description")]
    public string Description { get; set; }

    [DisplayName("Room")]
    public Guid Room { get; set; }

    [DisplayName("Session start time")]
    public DateTime Start { get; set; }

    [DisplayName("Session end time")]
    public DateTime End { get; set; }

    [Required]
    public Guid Key { get; set; }
  }
}