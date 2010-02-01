using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Ccs.Models
{
  public class Session : IKeyable
  {
    [Required]
    public Guid Key { get; set; }

    [DisplayName("Speaker")]
    [Required]
    public List<Guid> SpeakerKeys { get; set; }

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
  }
}