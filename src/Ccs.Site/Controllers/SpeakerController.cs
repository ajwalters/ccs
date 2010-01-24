using System.Web.Mvc;

using Ccs.Site.Models;

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

    public ActionResult Details(string id)
    {
      var model = new Speaker
                  {
                    Name = "Michael D. Hall",
                    Biography = "Mike is a cool guy."
                  };

      return View(model);
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