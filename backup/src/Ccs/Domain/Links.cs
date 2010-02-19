using System;
using System.Collections.Generic;

using Ccs.Data;

namespace Ccs.Domain
{
  public class Links : IKeyable
  {
    /// <summary>
    /// Initializes a new instance of the <see cref="Links"/> class.
    /// </summary>
    public Links()
    {
      Items = new List<LinkItem>();
    }

    /// <summary>
    /// Gets or sets the id.
    /// </summary>
    /// <value>The id.</value>
    public Guid Id { get; set; }

    /// <summary>
    /// Gets or sets the items.
    /// </summary>
    /// <value>The items.</value>
    public List<LinkItem> Items { get; set; }

    /// <summary>
    /// Gets or sets the name.
    /// </summary>
    /// <value>The name.</value>
    public string Name { get; set; }

    /// <summary>
    /// Gets or sets the key.
    /// </summary>
    /// <value>The key.</value>
    public Guid Key { get; set; }
  }
}