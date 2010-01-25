using System.Collections.Generic;
using System.Web.Mvc;

using Ccs.Site.Models;

namespace Ccs.Site.Controllers
{
  public class SpeakerController : Controller
  {
    public static readonly NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      var model = new List<Speaker>
                  {
                    new Speaker
                    {
                      Name = "Michael D. Hall",
                      Biography = "Mike is a cool guy.",
                      ImageName = "michaeldhall.jpg"
                    }
                  };

      return View(model);
    }

    /// <summary>
    /// Detailses the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Details(string id)
    {
      var model = new Speaker
                  {
                    Name = "Michael D. Hall",
                    Biography = "Mike is a cool guy.",
                    ImageName = "michaeldhall.jpg"
                  };

      return View(model);
    }

    /// <summary>
    /// Creates this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Create()
    {
      return View();
    }

    /// <summary>
    /// Deletes the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Delete(string id)
    {
      return View();
    }

    /// <summary>
    /// Creates the specified collection.
    /// </summary>
    /// <param name="collection">The collection.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(FormCollection collection)
    {
      try
      {
        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Edit(string id)
    {
      return View();
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <param name="collection">The collection.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(int id, FormCollection collection)
    {
      try
      {
        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }
  }
}