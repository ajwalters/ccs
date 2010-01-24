using System.Web.Mvc;

namespace Ccs.Site.Controllers
{
  public class SpeakerController : Controller
  {
    //
    // GET: /Speaker/

    public ActionResult Index()
    {
      return View();
    }

    //
    // GET: /Speaker/Details/5

    public ActionResult Details(int id)
    {
      return View();
    }

    //
    // GET: /Speaker/Create

    public ActionResult Create()
    {
      return View();
    }

    //
    // POST: /Speaker/Create

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
    // GET: /Speaker/Edit/5

    public ActionResult Edit(int id)
    {
      return View();
    }

    //
    // POST: /Speaker/Edit/5

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