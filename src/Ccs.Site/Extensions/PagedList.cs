using System.Collections.Generic;
using System.Linq;

namespace System.Web.Mvc
{
  public class PagedList<T> : List<T>, IPagedList
  {
    public PagedList(IQueryable<T> source, int index, int pageSize)
    {
      TotalCount = source.Count();
      PageSize = pageSize;
      PageIndex = index;
      AddRange(source.Skip(index*pageSize).Take(pageSize).ToList());
    }

    public PagedList(List<T> source, int index, int pageSize)
    {
      TotalCount = source.Count();
      PageSize = pageSize;
      PageIndex = index;
      AddRange(source.Skip(index*pageSize).Take(pageSize).ToList());
    }

    public int TotalCount { get; set; }

    public int PageIndex { get; set; }

    public int PageSize { get; set; }

    public bool IsPreviousPage
    {
      get { return (PageIndex > 0); }
    }

    public bool IsNextPage
    {
      get { return (PageIndex*PageSize) <= TotalCount; }
    }
  }
}