using System.Collections.Generic;

namespace Ccs.Site.Models
{
  public interface IAgenda
  {
    List<Session> Sessions { get; set; }
  }

  public class Agenda : IAgenda
  {
    public List<Session> Sessions { get; set; }
  }
}