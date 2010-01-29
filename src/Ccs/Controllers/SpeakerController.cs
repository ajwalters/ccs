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
  public class SpeakerController : Controller
  {
    static readonly IObjectContainer _db = Db4oFactory.OpenFile(
      ObjectDatabase.ExpandDataDirectory(ConfigurationManager.ConnectionStrings["ObjectStore"].ConnectionString));

    public static readonly object _padlock = new object();

    public static readonly Logger log = LogManager.GetCurrentClassLogger();

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
      return View((from Speaker o in Db
                   select o).ToList());
    }

    /// <summary>
    /// Detailses the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <returns></returns>
    public ActionResult Details(Guid id)
    {
      return View((from Speaker o in Db
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
    public void Delete(Guid id)
    {
      var query = from Speaker o in Db
                  where o.Id == id
                  select o;
      if (0 < query.Count())
      {
        Db.Delete(query.First());
      }

      RedirectToAction("Index", "Speaker");
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
        var q = (from Speaker o in Db
                 where o.Id == model.Id
                 select o);
        if (0 < q.Count())
        {
          throw new WebException("The speaker already exists.");
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
      return View((from Speaker o in Db
                   where o.Id == id
                   select o).First());
    }

    /// <summary>
    /// Edits the specified id.
    /// </summary>
    /// <param name="id">The id.</param>
    /// <param name="speaker">The speaker.</param>
    /// <returns></returns>
    [HttpPost]
    public ActionResult Edit(Guid id, Speaker speaker)
    {
      try
      {
        var model = (from Speaker o in Db
                     where o.Id == id
                     select o).First();

        model.Name = speaker.Name;
        model.ImageName = speaker.ImageName;
        model.Biography = speaker.Biography;

        Db.Store(model);

        return RedirectToAction("Details", new {speaker.Id});
      }
      catch
      {
        return View();
      }
    }
  }
}