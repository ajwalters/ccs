using System;
using System.Collections.Generic;

namespace Ccs.Site.Models
{
  public class Links : ILink
  {
    public Links()
    {
      Items = new List<LinkItem>();
    }

    public Guid Id { get; set; }

    public List<LinkItem> Items { get; set; }

    public string Name { get; set; }
  }
}