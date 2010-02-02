using System;

using Db4objects.Db4o.Linq;

namespace Ccs.Data
{
  public interface IKeyedRepository<T> where T : IKeyable
  {
    IDb4oLinqQuery<T> FetchAll();

    T FetchByKey(Guid key);

    void DeleteByKey(Guid key);

    void Add(T entity);

    void Update(Guid key, T entity);
  }
}