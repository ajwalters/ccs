using System;

namespace Ccs.Data
{
  public interface IKeyable
  {
    Guid Key { get; set; }
  }
}