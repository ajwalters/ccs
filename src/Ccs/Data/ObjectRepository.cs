using System;
using System.Linq;

using Db4objects.Db4o.Linq;

namespace Ccs.Data
{
  public abstract class ObjectRepository<T> : IKeyedRepository<T> where T : IKeyable
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

    public virtual void DeleteByKey(Guid key)
    {
      var query = from T o in Db.Container
                  where o.Key == key
                  select o;
      if (0 < query.Count())
      {
        Db.Container.Delete(query.First());
      }
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

    public abstract void Update(Guid key, T entity);
  }
}