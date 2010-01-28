using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Ccs.Site.Models
{
  public class Session : ISession
  {
    [Required]
    public Guid Id { get; set; }

    [DisplayName("Session name")]
    public string Name { get; set; }

    [DisplayName("User name")]
    public string Speaker { get; set; }

    [DisplayName("Session abstract")]
    public string Abstract { get; set; }

    [DisplayName("Session description")]
    public string Description { get; set; }

    [DisplayName("Room")]
    public string Room { get; set; }

    [DisplayName("Session start time")]
    public DateTime Start { get; set; }

    [DisplayName("Session end time")]
    public DateTime End { get; set; }
  }
}