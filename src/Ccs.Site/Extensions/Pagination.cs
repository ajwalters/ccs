using System.Linq;

namespace System.Web.Mvc
{
  public static class Pagination
  {
    /// <summary>
    /// Toes the paged list.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="source">The source.</param>
    /// <param name="index">The index.</param>
    /// <param name="pageSize">Size of the page.</param>
    /// <returns></returns>
    public static PagedList<T> ToPagedList<T>(this IQueryable<T> source, int index, int pageSize)
    {
      return new PagedList<T>(source, index, pageSize);
    }

    /// <summary>
    /// Toes the paged list.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="source">The source.</param>
    /// <param name="index">The index.</param>
    /// <returns></returns>
    public static PagedList<T> ToPagedList<T>(this IQueryable<T> source, int index)
    {
      return new PagedList<T>(source, index, 10);
    }
  }
}