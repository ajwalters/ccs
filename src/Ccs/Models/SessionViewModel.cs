using System;
using System.Web.Mvc;

namespace Ccs.Models
{
  public class SessionViewModel
  {
    string Name { get; set; }

    DateTime Start { get; set; }

    DateTime End { get; set; }

    string Abstract { get; set; }

    SelectList Sessions { get; set; }
  }

  public class SessionListItemModel
  {
    Guid Key { get; set; }

    string Name { get; set; }
  }
}