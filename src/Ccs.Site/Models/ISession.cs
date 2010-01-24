using System;

namespace Ccs.Site.Models
{
  public interface ISession
  {
    string Name { get; set; }

    string Speaker { get; set; }

    string Abstract { get; set; }

    string Description { get; set; }

    string Room { get; set; }

    DateTime Start { get; set; }

    DateTime End { get; set; }
  }
}