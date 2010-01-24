using System.Collections.Generic;
using System.ComponentModel;

namespace Ccs.Site.Models
{
  public class Speaker : ISpeaker
  {
    [DisplayName("Speaker name")]
    public string Name { get; set; }

    [DisplayName("Speaker biography")]
    public string Biography { get; set; }

    [DisplayName("Registered Sessions")]
    public List<ISession> Sessions { get; set; }
  }
}