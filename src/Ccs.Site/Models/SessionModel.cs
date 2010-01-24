using System;

namespace Ccs.Site.Models
{
  public class SessionModel : ISessionModel
  {
    public string Name { get; set; }

    public string UserName { get; set; }

    public string Abstract { get; set; }

    public string Description { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
  }
}