using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

using Ccs.Data;

namespace Ccs.Domain

{
  public class Speaker : IKeyable
  {
    /// <summary>
    /// Gets or sets the name.
    /// </summary>
    /// <value>The name.</value>
    [DisplayName("Speaker name")]
    public string Name { get; set; }

    /// <summary>
    /// Gets or sets the biography.
    /// </summary>
    /// <value>The biography.</value>
    [DisplayName("Speaker biography")]
    public string Biography { get; set; }

    /// <summary>
    /// Gets or sets the image link.
    /// </summary>
    /// <value>The image link.</value>
    [DisplayName("Image link for speaker.")]
    [DefaultValue("default_image.jpg")]
    public string ImageName { get; set; }

    [DisplayName("Sessions")]
    public List<Guid> SessionKeys { get; set; }

    /// <summary>
    /// Gets or sets the key.
    /// </summary>
    /// <value>The key.</value>
    [Required]
    public Guid Key { get; set; }
  }
}