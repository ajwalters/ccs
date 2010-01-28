using System.Collections.Generic;

namespace Ccs.Site.Models
{
  public interface ILink
  {
    string Name { get; set; }

    List<LinkItem> Items { get; set; }
  }
}