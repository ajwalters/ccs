using System.Linq;

namespace System.Web.Mvc
{
  public static class Pagination
  {
    public static PagedList<T> ToPagedList<T>(this IQueryable<T> source, int index, int pageSize)
    {
      return new PagedList<T>(source, index, pageSize);
    }

    public static PagedList<T> ToPagedList<T>(this IQueryable<T> source, int index)
    {
      return new PagedList<T>(source, index, 10);
    }
  }
}