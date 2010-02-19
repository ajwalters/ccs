using System;
using System.Collections.Generic;

using Db4objects.Db4o.Linq;

namespace Ccs.Data
{
  public interface IObjectRepository<T> where T : IKeyable
  {
    IDb4oLinqQuery<T> FetchAll();

    IDb4oLinqQuery<T> FetchByKeys(List<Guid> keys);

    T FetchByKey(Guid key);

    void Delete(T entity);

    void DeleteByKey(Guid key);

    void Add(T entity);

    void Update(T entity);

    T Attach(T entity);

    bool Exists(T entity);
  }
}