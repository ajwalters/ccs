using System;

namespace Ccs.Site.Models
{
  public interface ISessionModel
  {
    string Name { get; set; }

    string UserName { get; set; }

    string Abstract { get; set; }

    string Description { get; set; }

    DateTime CreatedAt { get; }

    DateTime UpdatedAt { get; }
  }
}