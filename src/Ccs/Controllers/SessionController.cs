using System;
using System.Linq;
using System.Net;
using System.Web.Mvc;

using Ccs.Models;

using Db4objects.Db4o.Linq;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SessionController : Controller
  {
    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      return View((from Session o in Db.Container
                   select o).ToList());
    }

    /// <summary>
    /// Detailses the specified key.
    /// </summary>
    /// <param name="key">The key.</param>
    /// <returns></returns>
    public ActionResult Details(Guid key)
    {
      return View((from Session o in Db.Container
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
    /// <param name="key">The id.</param>
    /// <returns></returns>
    public ActionResult Delete(Guid key)
    {
      var query = from Session o in Db.Container
                  where o.Key == key
                  select o;
      if (0 < query.Count())
      {
        Db.Container.Delete(query.First());
      }

      return RedirectToAction("Index");
    }

    /// <summary>
    /// Creates the specified session.
    /// </summary>
    /// <param name="session">The model.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(Session session)
    {
      try
      {
        var q = (from Session o in Db.Container
                 where o.Key == session.Key
                 select o);
        if (0 < q.Count())
        {
          throw new WebException("The Session already exists.");
        }
        session.Key = Guid.NewGuid();
        Db.Container.Store(session);

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
      return View((from Session o in Db.Container
                   where o.Key == key
                   select o).First());
    }

    /// <summary>
    /// Edits the specified key.
    /// </summary>
    /// <param name="key">The id.</param>
    /// <param name="session">The session.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid key, Session session)
    {
      try
      {
        var model = (from Session o in Db.Container
                     where o.Key == key
                     select o).First();

        model.Name = session.Name;
        model.Abstract = session.Abstract;
        model.Room = session.Room;
        //model.Speaker = session.Speaker;
        model.Start = session.Start;
        model.End = session.End;

        Db.Container.Store(model);

        return RedirectToAction("Details", new {session.Key});
      }
      catch
      {
        return View();
      }
    }
  }
}