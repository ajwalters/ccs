using System;
using System.Linq;
using System.Net;
using System.Web.Mvc;

using Ccs.Models;

using Db4objects.Db4o.Linq;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SpeakerController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      return View((from Speaker o in Db.Container
                   select o).ToList());
    }

    /// <summary>
    /// Detailses the specified key.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    public ActionResult Details(Guid key)
    {
      return View((from Speaker o in Db.Container
                   where o.Key == key
                   select o).First());
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
    /// Deletes the specified key.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    public ActionResult Delete(Guid key)
    {
      var query = from Speaker o in Db.Container
                  where o.Key == key
                  select o;
      if (0 < query.Count())
      {
        Db.Container.Delete(query.First());
      }

      return RedirectToAction("Index");
    }

    /// <summary>
    /// Creates the specified model.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(Speaker model)
    {
      try
      {
        var q = (from Speaker o in Db.Container
                 where o.Key == model.Key
                 select o);
        if (0 < q.Count())
        {
          throw new WebException("The speaker already exists.");
        }
        model.Key = Guid.NewGuid();
        Db.Container.Store(model);

        return RedirectToAction("Index");
      }
      catch
      {
        return View();
      }
    }

    /// <summary>
    /// Edits the specified key.
    /// </summary>
    /// <param name="key">The id.</param>
    /// <returns></returns>
    public ActionResult Edit(Guid key)
    {
      return View((from Speaker o in Db.Container
                   where o.Key == key
                   select o).First());
    }

    /// <summary>
    /// Edits the specified key.
    /// </summary>
    /// <param name="key">The id.</param>
    /// <param name="speaker">The speaker.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid key, Speaker speaker)
    {
      try
      {
        var model = (from Speaker o in Db.Container
                     where o.Key == key
                     select o).First();

        model.Name = speaker.Name;
        model.ImageName = speaker.ImageName;
        model.Biography = speaker.Biography;

        Db.Container.Store(model);

        return RedirectToAction("Details", new {speaker.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}