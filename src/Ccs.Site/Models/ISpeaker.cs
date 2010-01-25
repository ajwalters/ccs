using System.Collections.Generic;

namespace Ccs.Site.Models
{
  public interface ISpeaker
  {
    /// <summary>
    /// Gets or sets the name.
    /// </summary>
    /// <value>The name.</value>
    string Name { get; set; }

    /// <summary>
    /// Gets or sets the biography.
    /// </summary>
    /// <value>The biography.</value>
    string Biography { get; set; }

    /// <summary>
    /// Gets or sets the sessions.
    /// </summary>
    /// <value>The sessions.</value>
    List<ISession> Sessions { get; set; }

    /// <summary>
    /// Gets or sets the image link.
    /// </summary>
    /// <value>The image link.</value>
    string ImageName { get; set; }
  }
}