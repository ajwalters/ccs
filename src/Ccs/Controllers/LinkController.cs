using System.Web.Mvc;

namespace Ccs.Site.Controllers
{
  public class LinkController : Controller
  {
    //
    // GET: /Link/

    public ActionResult Index()
    {
      return View();
    }

    //
    // GET: /Link/Details/5

    public ActionResult Details(int id)
    {
      return View();
    }

    //
    // GET: /Link/Create

    public ActionResult Create()
    {
      return View();
    }

    //
    // POST: /Link/Create

    [HttpPost]
    public ActionResult Create(FormCollection collection)
    {
      try
      {
        // TODO: Add insert logic here

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    //
    // GET: /Link/Edit/5

    public ActionResult Edit(int id)
    {
      return View();
    }

    //
    // POST: /Link/Edit/5

    [HttpPost]
    public ActionResult Edit(int id, FormCollection collection)
    {
      try
      {
        // TODO: Add update logic here

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}