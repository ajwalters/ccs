using System;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;

using Db4objects.Db4o.Linq;

namespace Ccs.Site.Models
{
  public class ObjectRepository<T> : IRepository<T> where T : class
  {
    /// <summary>
    /// Returns all T records in the repository
    /// </summary>
    public IQueryable<T> GetAll()
    {
      return (from T items in ObjectDatabase.Container
              select items).AsQueryable();
    }

    /// <summary>
    /// Returns a PagedList of items
    /// </summary>
    /// <param name="pageIndex">zero-based index to be used for lookup</param>
    /// <param name="pageSize">the size of the paged items</param>
    /// <returns></returns>
    public PagedList<T> GetPaged(int pageIndex, int pageSize)
    {
      var query = (from T items in ObjectDatabase.Container
                   select items).AsQueryable();
      return new PagedList<T>(query, pageIndex, pageSize);
    }

    /// <summary>
    /// Finds an item using a passed-in expression lambda
    /// </summary>
    public IQueryable<T> Find(Expression<Func<T, bool>> expression)
    {
      return GetAll().Where(expression);
    }

    /// <summary>
    /// Saves an item to the database
    /// </summary>
    /// <param name="item"></param>
    public void Save(T item)
    {
      ObjectDatabase.Container.Store(item);
    }

    /// <summary>
    /// Deletes an item from the database
    /// </summary>
    /// <param name="item"></param>
    public void Delete(T item)
    {
      ObjectDatabase.Container.Delete(item);
    }

    public void Update(T entity, Action<T> action)
    {
      var o = ObjectDatabase.Container.QueryByExample(entity);
      var s = (T) o.Next();
      action.Invoke(s);
      ObjectDatabase.Container.Store(s);
    }

    public void DeleteBy(Guid id)
    {
      var q = (from Speaker s in ObjectDatabase.Container
               where s.Id == id
               select s).First();

      ObjectDatabase.Container.Delete(q);
    }
  }
}