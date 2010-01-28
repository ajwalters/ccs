using System.Collections.Generic;
using System.Linq;

namespace System.Web.Mvc
{
  public class PagedList<T> : List<T>, IPagedList
  {
    /// <summary>
    /// Initializes a new instance of the <see cref="PagedList&lt;T&gt;"/> class.
    /// </summary>
    /// <param name="source">The source.</param>
    /// <param name="index">The index.</param>
    /// <param name="pageSize">Size of the page.</param>
    public PagedList(IQueryable<T> source, int index, int pageSize)
    {
      TotalCount = source.Count();
      PageSize = pageSize;
      PageIndex = index;
      AddRange(source.Skip(index*pageSize).Take(pageSize).ToList());
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="PagedList&lt;T&gt;"/> class.
    /// </summary>
    /// <param name="source">The source.</param>
    /// <param name="index">The index.</param>
    /// <param name="pageSize">Size of the page.</param>
    public PagedList(IEnumerable<T> source, int index, int pageSize)
    {
      TotalCount = source.Count();
      PageSize = pageSize;
      PageIndex = index;
      AddRange(source.Skip(index*pageSize).Take(pageSize).ToList());
    }

    /// <summary>
    /// Gets or sets the total count.
    /// </summary>
    /// <value>The total count.</value>
    public int TotalCount { get; set; }

    /// <summary>
    /// Gets or sets the index of the page.
    /// </summary>
    /// <value>The index of the page.</value>
    public int PageIndex { get; set; }

    /// <summary>
    /// Gets or sets the size of the page.
    /// </summary>
    /// <value>The size of the page.</value>
    public int PageSize { get; set; }

    /// <summary>
    /// Gets a value indicating whether this instance is previous page.
    /// </summary>
    /// <value>
    /// 	<c>true</c> if this instance is previous page; otherwise, <c>false</c>.
    /// </value>
    public bool IsPreviousPage
    {
      get { return (PageIndex > 0); }
    }

    /// <summary>
    /// Gets a value indicating whether this instance is next page.
    /// </summary>
    /// <value>
    /// 	<c>true</c> if this instance is next page; otherwise, <c>false</c>.
    /// </value>
    public bool IsNextPage
    {
      get { return (PageIndex*PageSize) <= TotalCount; }
    }
  }
}