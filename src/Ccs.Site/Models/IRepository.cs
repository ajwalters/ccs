using System;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace Ccs.Site.Models
{
  public interface IRepository<T>
  {
    IQueryable<T> GetAll();

    PagedList<T> GetPaged(int pageIndex, int pageSize);

    IQueryable<T> Find(Expression<Func<T, bool>> expression);

    void Save(T item);

    void Delete(T item);
  }
}