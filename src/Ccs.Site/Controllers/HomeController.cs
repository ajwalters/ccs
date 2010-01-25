using System.Web.Mvc;

namespace Ccs.Site.Controllers
{
  [HandleError]
  public class HomeController : Controller
  {
    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      ViewData["Message"] = "Welcome to ASP.NET MVC!";

      return View();
    }

    /// <summary>
    /// Contacts this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Contact()
    {
      return View();
    }
  }
}