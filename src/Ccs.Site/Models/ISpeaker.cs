using System.Collections.Generic;

namespace Ccs.Site.Models
{
  public interface ISpeaker
  {
    string Name { get; set; }

    string Biography { get; set; }

    List<ISession> Sessions { get; set; }
  }
}