using System;
using System.Collections.Generic;
using System.Linq;

using Db4objects.Db4o.Linq;

namespace Ccs.Data
{
  public abstract class ObjectRepository<T> : IObjectRepository<T> where T : IKeyable
  {
    public virtual IDb4oLinqQuery<T> FetchAll()
    {
      return (from T o in Db.Container
              select o);
    }

    public virtual T FetchByKey(Guid key)
    {
      return (from T o in Db.Container
              where o.Key == key
              select o).First();
    }

    public void Delete(T entity)
    {
      Db.Container.Delete(Db.Container.QueryByExample(entity));
    }

    public virtual void DeleteByKey(Guid key)
    {
      Db.Container.Delete(FetchByKey(key));
    }

    public virtual void Add(T entity)
    {
      var q = (from T o in Db.Container
               where o.Key == entity.Key
               select o);
      if (0 < q.Count())
      {
        throw new Exception(string.Format("The {0} already exists.", typeof (T).Name));
      }
      entity.Key = Guid.NewGuid();
      Db.Container.Store(entity);
    }

    public abstract void Update(T entity);

    public T Attach(T entity)
    {
      return FetchByKey(entity.Key);
    }

    public virtual IDb4oLinqQuery<T> FetchByKeys(List<Guid> keys)
    {
      return from T o in Db.Container
             where keys.Contains(o.Key)
             select o;
    }
  }
}