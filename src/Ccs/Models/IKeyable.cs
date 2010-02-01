using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ccs.Models {
  public interface IKeyable {

    Guid Key { get; set; }
  }
}
