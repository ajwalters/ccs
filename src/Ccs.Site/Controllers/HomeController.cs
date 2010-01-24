using System.Web.Mvc;

namespace Ccs.Site.Controllers
{
  [HandleError]
  public class HomeController : Controller
  {
    public ActionResult Index()
    {
      ViewData["Message"] = "Welcome to ASP.NET MVC!";

      return View();
    }

    public ActionResult Contact()
    {
      return View();
    }

    public ActionResult About()
    {
      return View();
    }
  }
}