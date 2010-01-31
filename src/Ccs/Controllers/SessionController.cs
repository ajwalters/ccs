using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web.Mvc;

using Ccs.Site.Models;

using Db4objects.Db4o;
using Db4objects.Db4o.Linq;

using NLog;

namespace Ccs.Site.Controllers
{
  public class SessionController : Controller
  {
    static readonly IObjectContainer _db = Db4oFactory.OpenFile(
      ObjectDatabase.ExpandDataDirectory(ConfigurationManager.ConnectionStrings["ObjectStore"].ConnectionString));

    public static readonly object _padlock = new object();

    public static readonly Logger log = LogManager.GetCurrentClassLogger();

    /// <summary>
    /// Gets the db.
    /// </summary>
    /// <value>The db.</value>
    public IObjectContainer Db
    {
      get
      {
        lock (_padlock)
        {
          return _db;
        }
      }
    }

    /// <summary>
    /// Indexes this instance.
    /// </summary>
    /// <returns></returns>
    public ActionResult Index()
    {
      return View((from Session o in Db
                   select o).ToList());
    }

    /// <summary>
    /// Detailses the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Details(Guid id)
    {
      return View((from Session o in Db
                   where o.Id == id
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
    /// Deletes the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Delete(Guid id)
    {
      var query = from Session o in Db
                  where o.Id == id
                  select o;
      if (0 < query.Count())
      {
        Db.Delete(query.First());
      }

      return RedirectToAction("Index");
    }

    /// <summary>
    /// Creates the specified model.
    /// </summary>
    /// <param name="model">The model.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Create(Session model)
    {
      try
      {
        var q = (from Session o in Db
                 where o.Id == model.Id
                 select o);
        if (0 < q.Count())
        {
          throw new WebException("The Session already exists.");
        }
        model.Id = Guid.NewGuid();
        Db.Store(model);

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
    public ActionResult Edit(Guid id)
    {
      return View((from Session o in Db
                   where o.Id == id
                   select o).First());
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <param name="session">The session.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid id, Session session)
    {
      try
      {
        var model = (from Session o in Db
                     where o.Id == id
                     select o).First();

        model.Name = session.Name;
        model.Abstract = session.Abstract;
        model.Room = session.Room;
        model.Speaker = session.Speaker;
        model.Start = session.Start;
        model.End = session.End;

        Db.Store(model);

        return RedirectToAction("Details", new {session.Id});
      }
      catch
      {
        return View();
      }
    }
  }
}