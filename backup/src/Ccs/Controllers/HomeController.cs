using System.Web.Mvc;

using NLog;

namespace Ccs.Site.Controllers
{
  [HandleError]
  public class HomeController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

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