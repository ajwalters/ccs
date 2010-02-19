using System;
using System.Web.Mvc;

using Ccs.Domain;

namespace Ccs.Models
{
  public class SpeakerViewModel
  {
  }

  public class SessionViewModel
  {
    public string Description { get; set; }

    public string Name { get; set; }

    public DateTime Start { get; set; }

    public DateTime End { get; set; }

    public string Abstract { get; set; }

    public SelectList Sessions { get; set; }

    public Guid Key { get; set; }

    public Room Room { get; set; }
  }

  public class SessionListItemModel
  {
    Guid Key { get; set; }

    string Name { get; set; }
  }
}