namespace System.Web.Mvc
{
  public interface IPagedList
  {
    /// <summary>
    /// Gets or sets the total count.
    /// </summary>
    /// <value>The total count.</value>
    int TotalCount { get; set; }

    /// <summary>
    /// Gets or sets the index of the page.
    /// </summary>
    /// <value>The index of the page.</value>
    int PageIndex { get; set; }

    /// <summary>
    /// Gets or sets the size of the page.
    /// </summary>
    /// <value>The size of the page.</value>
    int PageSize { get; set; }

    /// <summary>
    /// Gets a value indicating whether this instance is previous page.
    /// </summary>
    /// <value>
    /// 	<c>true</c> if this instance is previous page; otherwise, <c>false</c>.
    /// </value>
    bool IsPreviousPage { get; }

    /// <summary>
    /// Gets a value indicating whether this instance is next page.
    /// </summary>
    /// <value>
    /// 	<c>true</c> if this instance is next page; otherwise, <c>false</c>.
    /// </value>
    bool IsNextPage { get; }
  }
}